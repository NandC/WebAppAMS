<%@ Control Language="VB" ClassName="Header1" %>

<script runat="server">
    Protected Sub Page_Load(sender As Object, e As EventArgs)


    End Sub

</script>

<header class="site-header">
    <div class="top-nav">
        <div class="grid-container show-for-large">
            <div class="grid-x">
                <div class="cell">
                    <ul class="menu top-nav-menu align-right">
                        <li>
                            <a class="logout" data-open="logout-confirmation">Logout <i class="far fa-sign-out fa-fw"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="primary-nav">
        <div id="mobile-nav-buttons-grid" class="grid-x grid-padding-x small-up-3 hide-for-large loading">
            <a data-toggle="mobile-menu-container" id="mobile-menu-toggler" class="cell">
                <span class="link-icon">
                    <i class="far fa-bars fa-fw"></i>
                    <i class="far fa-times fa-fw hide"></i>
                </span>
                <span class="link-text">Menu</span>
            </a>
            <a data-open="logout-confirmation" class="logout cell">
                <span class="link-icon"><i class="far fa-sign-out fa-fw"></i></span>
                <span class="link-text">Logout</span>
            </a>
        </div>

        <div class="grid-container">
            <div class="grid-x align-justify align-middle">
                <div class="cell small-12 large-shrink text-center">
                    <a href="/" class="site-logo">
                        <img src="http://amsfsg-framework.gatorworks.site/assets/img/ams-logo.png" alt="AMS">
                    </a>
                </div>

                <div class="cell auto text-right">
                    <nav class="flexible-nav loading">
                        <div id="mobile-menu-container" class="hide-for-large closed" data-toggler=".closed">
                            <span class="border"></span>
                            <h3 class="site-section-title">Company Intranet</h3>

                            <ul class="menu primary-nav-menu vertical accordion-menu" data-accordion-menu data-submenu-toggle="true">
                                <!-- consider loading menu items from partial/controller file -->
                                <!-- should be the same menu items included below for desktop nav -->
                                <li id="" class="menu-item">
                                    <a href="Agents.aspx">
                                        <span class="link-icon"><i class="far fa-users"></i></span>
                                        <span class="link-text">Agents</span>
                                    </a>
                                </li>
                                <li id=""  class="menu-item">
                                    <a href="Groups.aspx">
                                        <span class="link-icon"><i class="far fa-layer-group"></i></span>
                                        <span class="link-text">Groups</span>
                                    </a>
                                </li>
                                <li id=""  class="menu-item">
                                    <a href="Companies.aspx">
                                        <span class="link-icon"><i class="far fa-building"></i></span>
                                        <span class="link-text">Companies</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="Production.aspx">
                                        <span class="link-icon"><i class="far fa-usd-square"></i></span>
                                        <span class="link-text">Production</span>
                                    </a>
                                </li> 
                                <li id="" class="menu-item">
                                    <a href="Notes.aspx">
                                        <span class="link-icon"><i class="far fa-sticky-note"></i></span>
                                        <span class="link-text">Notes</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="Tools.aspx">
                                        <span class="link-icon"><i class="far fa-toolbox"></i></span>
                                        <span class="link-text">Tools</span>
                                    </a>
                                </li>
                               <li id="" class="menu-item">
                                    <a href="Competitors.aspx">
                                        <span class="link-icon"><i class="far fa-compress"></i></span>
                                        <span class="link-text">Competitors</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="NewBusiness.aspx">
                                        <span class="link-icon"><i class="far fa-plus-octagon"></i></span>
                                        <span class="link-text">New Business</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="Compensation.aspx">
                                        <span class="link-icon"><i class="far fa-money-bill-wave-alt"></i></span>
                                        <span class="link-text">Compensation</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="Prospects.aspx?i=13">
                                        <span class="link-icon"><i class="far fa-unlock-alt"></i></span>
                                        <span class="link-text">Prospects</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="CallCampaigns.aspx?i=13">
                                        <span class="link-icon"><i class="far fa-phone-square"></i></span>
                                        <span class="link-text">Call Campaigns</span>
                                    </a>
                                </li>
                            </ul>

                        </div>

                        <div id="desktop-menu-container" class="show-for-large">
                              <ul class="menu primary-nav-menu visible-links dropdown" data-dropdown-menu>
                                  <!-- consider loading menu items from partial/controller file -->
                                  <!-- should be the same menu items included above for mobile nav -->
                                <li id="" class="menu-item">
                                    <a href="Agents.aspx">
                                        <span class="link-icon"><i class="far fa-users"></i></span>
                                        <span class="link-text">Agents</span>
                                    </a>
                                </li>
                                <li id=""  class="menu-item">
                                    <a href="Groups.aspx">
                                        <span class="link-icon"><i class="far fa-layer-group"></i></span>
                                        <span class="link-text">Groups</span>
                                    </a>
                                </li>
                                <li id=""  class="menu-item">
                                    <a href="Companies.aspx">
                                        <span class="link-icon"><i class="far fa-building"></i></span>
                                        <span class="link-text">Companies</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="Production.aspx">
                                        <span class="link-icon"><i class="far fa-usd-square"></i></span>
                                        <span class="link-text">Production</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="Notes.aspx">
                                        <span class="link-icon"><i class="far fa-sticky-note"></i></span>
                                        <span class="link-text">Notes</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="Tools.aspx">
                                        <span class="link-icon"><i class="far fa-toolbox"></i></span>
                                        <span class="link-text">Tools</span>
                                    </a>
                                </li>
                               <li id="" class="menu-item">
                                    <a href="Competitors.aspx">
                                        <span class="link-icon"><i class="far fa-compress"></i></span>
                                        <span class="link-text">Competitors</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="NewBusiness.aspx">
                                        <span class="link-icon"><i class="far fa-plus-octagon"></i></span>
                                        <span class="link-text">New Business</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="Compensation.aspx">
                                        <span class="link-icon"><i class="far fa-money-bill-wave-alt"></i></span>
                                        <span class="link-text">Compensation</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="Prospects.aspx?i=13">
                                        <span class="link-icon"><i class="far fa-unlock-alt"></i></span>
                                        <span class="link-text">Prospects</span>
                                    </a>
                                </li>
                                <li id="" class="menu-item">
                                    <a href="CallCampaigns.aspx?i=13">
                                        <span class="link-icon"><i class="far fa-phone-square"></i></span>
                                        <span class="link-text">Call Campaigns</span>
                                    </a>
                                </li>
 
                                <li class="more-button opens-left hide">
                                    <a href="#">
                                        <span class="link-icon"><i class="far fa-bars fa-fw"></i></span>
                                        <span class="link-text">More Options</span>
                                    </a>
                                    <ul class="hidden-links horizontal dropdown menu nested" data-dropdown-menu></ul>
                                </li>
                              </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    
    <div class="breadcrumbs-nav">
        <div class="grid-container">
            <div class="grid-x grid-padding-x align-middle">
                <div class="cell small-12 large-shrink">
                    <h3 class="site-section-title">Company Intranet</h3>
                </div>

                <div class="cell small-12 large-shrink">
                    <!--<nav aria-label="You are here:" role="navigation">
                        <ul class="breadcrumbs">
                            <li><a href="/" class="home">Home</a></li>
                            <li><a href="/samples">Samples</a></li>
                            <li class="current">
                                  <span class="show-for-sr">Current: </span> Interest Rates
                            </li>
                        </ul>
                    </nav> -->
                </div>
            </div>
        </div>
    </div>
    
</header>


<div id="contact-dropdown" class="dropdown-pane cream-bg" data-dropdown data-close-on-click="true">
    <ul class="menu vertical">
        <li>
            <a href="tel:8004484510"><i class="far fa-phone"></i> Call 800.448.4510</a>
        </li>
        <li>
            <a href="mailto:ams@amsfsg.com"><i class="far fa-envelope"></i> Send Us a Message</a>
        </li>
        <li>
            <a href="Contact.aspx"><i class="far fa-info-circle"></i> Get More Info</a>
        </li>
    </ul>
</div>


<div id="logout-confirmation" class="reveal tiny" data-reveal>
    <h3>Are you sure you want logout?</h3>
    <div class="button-group expanded">
        <a href="DoLogout.aspx" class="button success"><i class="far fa-sign-out"></i> Logout</a>
        <a data-close class="button light-gray-bg"><i class="far fa-times"></i> Cancel</a>
    </div>
</div>
