Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1379263F04
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 09:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbgIJHwL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 03:52:11 -0400
Received: from cmta17.telus.net ([209.171.16.90]:46862 "EHLO cmta17.telus.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726676AbgIJHwK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 03:52:10 -0400
Received: from montezuma.home ([154.5.226.127])
        by cmsmtp with SMTP
        id GHNGkFWu5bozQGHNHkLc7R; Thu, 10 Sep 2020 01:52:08 -0600
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=ffbTNHYF c=1 sm=1 tr=0
 a=f8b3WT/FcTuUJCJtQO1udw==:117 a=f8b3WT/FcTuUJCJtQO1udw==:17
 a=x7bEGLp0ZPQA:10 a=COSDN44dAAMA:10 a=nlC_4_pT8q9DhB4Ho9EA:9 a=8k6WQxmsAAAA:8
 a=RqNXQR8M5P5TTkKvXxUA:9 a=RYjqcA5M83PKJKZd:21 a=0woedX9dP-rhXDa9:21
 a=PUjeQqilurYA:10
Date:   Thu, 10 Sep 2020 00:52:05 -0700 (PDT)
From:   Zwane Mwaikambo <zwanem@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
In-Reply-To: <20200909131059.GB3627076@kuha.fi.intel.com>
Message-ID: <alpine.DEB.2.21.2009100030340.31932@montezuma.home>
References: <alpine.DEB.2.21.2008271035320.30454@montezuma.home> <0013fe6c-c0a2-1759-c769-cda025e5eb38@infradead.org> <alpine.DEB.2.21.2008271058220.37762@montezuma.home> <alpine.DEB.2.21.2008271131570.37762@montezuma.home> <20200828123328.GF174928@kuha.fi.intel.com>
 <alpine.DEB.2.21.2008300220350.37231@montezuma.home> <20200903111047.GH1279097@kuha.fi.intel.com> <20200909131059.GB3627076@kuha.fi.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463810553-2119397623-1599724028=:31932"
Content-ID: <alpine.DEB.2.21.2009100049420.31932@montezuma.home>
X-CMAE-Envelope: MS4wfB9v4aJYMLyjs7lL/fvRwuBXVbNeHY9aWrjmyono+dMP5rqfa6y/yLE04pfGQvrYlEWIkwW3PxqN4r9tbCIJ6VsQs3YwvOMDsONhS7KZXOlb3UxCzRgR
 aBmG2ra4ww3qMLApcZT7U7KhRkI8HtYKYt4C0EbsLyH5T5cagu7gqV1IpZP4Fp7e/20pvWt3QO0T16OL1YTBNxQG9fVZ7XjfV1ykdNLWikLt6wx9thHqdsPk
 lFXq/ivFX++RCPZU4znwUPyxhgjk2MMAPRTCkwzerKrESbtq5G4bJKPZECRqI5SqyxpHSLcUyTVY1hZzsvg5WA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463810553-2119397623-1599724028=:31932
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2009100049421.31932@montezuma.home>

 Hi Heikki,

On Wed, 9 Sep 2020, Heikki Krogerus wrote:

> On Thu, Sep 03, 2020 at 02:10:50PM +0300, Heikki Krogerus wrote:
> > Hi Zwane,
> > 
> > Sorry to keep you waiting. I'm trying to find a board I can use to
> > test these...
> 
> I've now tested this (these) with ThinkPad X280, and there is no
> regression, however, now that (I think) I understand what's going on,
> I would not try to fix the issue like you do. I would simply make sure
> the alternate mode arrays are NULL terminated. For example with
> something like this:
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index cba6f77bea61b..7e66e4d232996 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -317,8 +317,8 @@ struct ucsi_connector {
>         struct typec_port *port;
>         struct typec_partner *partner;
>  
> -       struct typec_altmode *port_altmode[UCSI_MAX_ALTMODES];
> -       struct typec_altmode *partner_altmode[UCSI_MAX_ALTMODES];
> +       struct typec_altmode *port_altmode[UCSI_MAX_ALTMODES + 1];
> +       struct typec_altmode *partner_altmode[UCSI_MAX_ALTMODES + 1];
>  
>         struct typec_capability typec_cap;
> 
> Though I'm not sure we should need even that. Try it out in any case.
> 
> Even if that works, I have a feeling there is something odd going on.
> What kinds of device has all 30 modes supported (or even more)? I want
> to know if this is a case where the firmware is just reporting bogus
> values.
> 
> What device are you plugging to the Type-C connector? Does it really
> have all 30 altmodes? What do you see in /sys/class/typec directory
> when you connect the device?
> 
>         ls /sys/class/typec
> 
> Actually, do this:
> 
>         grep . /sys/class/typec/port*-partner/port*-partner.*/svid
> 
> and tell what you get.

Thanks for digging into it, the device being plugged in is a Lenovo TB 
dock 
(https://www.lenovo.com/ca/en/accessories-and-monitors/home-office/Thunderbolt-Dock-Gen-2-US/p/40AN0135US);

thinkpad :: ~ » ls /sys/class/typec
port0

thinkpad :: /sys/class/typec » grep . /sys/class/typec/port*-partner/port*-partner.*/svid
zsh: no matches found: /sys/class/typec/port*-partner/port*-partner.*/svid

thinkpad :: /sys/class/typec » find port0/
port0/
port0/uevent
port0/vconn_source
port0/supported_accessory_modes
port0/power_role
port0/data_role
port0/preferred_role
port0/firmware_node
port0/power
port0/power/runtime_active_time
port0/power/runtime_active_kids
port0/power/runtime_usage
port0/power/runtime_status
port0/power/autosuspend_delay_ms
port0/power/async
port0/power/runtime_suspended_time
port0/power/runtime_enabled
port0/power/control
port0/power_operation_mode
port0/usb_power_delivery_revision
port0/device
port0/subsystem
port0/usb_typec_revision
port0/port0.0
port0/port0.0/uevent
port0/port0.0/svid
port0/port0.0/vdo
port0/port0.0/mode
port0/port0.0/power
port0/port0.0/power/runtime_active_time
port0/port0.0/power/runtime_active_kids
port0/port0.0/power/runtime_usage
port0/port0.0/power/runtime_status
port0/port0.0/power/autosuspend_delay_ms
port0/port0.0/power/async
port0/port0.0/power/runtime_suspended_time
port0/port0.0/power/runtime_enabled
port0/port0.0/power/control
port0/port0.0/mode1
port0/port0.0/mode1/description
port0/port0.0/mode1/vdo
port0/port0.0/mode1/supported_roles
port0/port0.0/mode1/active
port0/port0.0/active

---1463810553-2119397623-1599724028=:31932--
