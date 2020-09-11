Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9DC2656E5
	for <lists+linux-usb@lfdr.de>; Fri, 11 Sep 2020 04:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbgIKCN6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 22:13:58 -0400
Received: from cmta20.telus.net ([209.171.16.93]:56056 "EHLO cmta20.telus.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725298AbgIKCN5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 22:13:57 -0400
Received: from montezuma.home ([154.5.226.127])
        by cmsmtp with SMTP
        id GYZSk20NXts7mGYZUku26A; Thu, 10 Sep 2020 20:13:53 -0600
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=esGhMbhX c=1 sm=1 tr=0
 a=f8b3WT/FcTuUJCJtQO1udw==:117 a=f8b3WT/FcTuUJCJtQO1udw==:17
 a=x7bEGLp0ZPQA:10 a=COSDN44dAAMA:10 a=nlC_4_pT8q9DhB4Ho9EA:9 a=8k6WQxmsAAAA:8
 a=IebrLaZWef6mYE8zfegA:9 a=TiBsYNRxH508HC9y:21 a=dWASqzKzZO7wXbe5:21
 a=wPNLvfGTeEIA:10
Date:   Thu, 10 Sep 2020 19:13:50 -0700 (PDT)
From:   Zwane Mwaikambo <zwanem@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
In-Reply-To: <20200910125018.GA3946915@kuha.fi.intel.com>
Message-ID: <alpine.DEB.2.21.2009101912020.31932@montezuma.home>
References: <alpine.DEB.2.21.2008271035320.30454@montezuma.home> <0013fe6c-c0a2-1759-c769-cda025e5eb38@infradead.org> <alpine.DEB.2.21.2008271058220.37762@montezuma.home> <alpine.DEB.2.21.2008271131570.37762@montezuma.home> <20200828123328.GF174928@kuha.fi.intel.com>
 <alpine.DEB.2.21.2008300220350.37231@montezuma.home> <20200903111047.GH1279097@kuha.fi.intel.com> <20200909131059.GB3627076@kuha.fi.intel.com> <alpine.DEB.2.21.2009100030340.31932@montezuma.home> <20200910125018.GA3946915@kuha.fi.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463810553-973498883-1599790433=:31932"
X-CMAE-Envelope: MS4wfFGmcBMF1iCwVhV/vbYXrdAy36Eqg48nkdwp/7F6jr6fLz5Sw8mbfDxlUWFmtJb8/pSxqVXOHMoGJildudBlE+JRhG9GPAeX2WqLJpF9fAnRa1q0ad56
 UjIspEJYh1t0uJ4jS28wGJqpcuhtgX92HMKmYyId6BZs9xzXFzKddpKy+YWW0h/4atRcPHujlVPKBwxRer/WFUP8wQ2+jW6jW/NG2N3uqnzMnAqZfivYc6tp
 n2ADLk6r9azlpS9O7rhxZPEGjx0fTqcFGrK6vVhbJCrbsR1zOhVw8a9Zt33gW411uexz5ysjfkl9Ix3zKQT50A==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463810553-973498883-1599790433=:31932
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Thu, 10 Sep 2020, Heikki Krogerus wrote:

> On Thu, Sep 10, 2020 at 12:52:05AM -0700, Zwane Mwaikambo wrote:
> >  Hi Heikki,
> > 
> > On Wed, 9 Sep 2020, Heikki Krogerus wrote:
> > 
> > > On Thu, Sep 03, 2020 at 02:10:50PM +0300, Heikki Krogerus wrote:
> > > > Hi Zwane,
> > > > 
> > > > Sorry to keep you waiting. I'm trying to find a board I can use to
> > > > test these...
> > > 
> > > I've now tested this (these) with ThinkPad X280, and there is no
> > > regression, however, now that (I think) I understand what's going on,
> > > I would not try to fix the issue like you do. I would simply make sure
> > > the alternate mode arrays are NULL terminated. For example with
> > > something like this:
> > > 
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > > index cba6f77bea61b..7e66e4d232996 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > @@ -317,8 +317,8 @@ struct ucsi_connector {
> > >         struct typec_port *port;
> > >         struct typec_partner *partner;
> > >  
> > > -       struct typec_altmode *port_altmode[UCSI_MAX_ALTMODES];
> > > -       struct typec_altmode *partner_altmode[UCSI_MAX_ALTMODES];
> > > +       struct typec_altmode *port_altmode[UCSI_MAX_ALTMODES + 1];
> > > +       struct typec_altmode *partner_altmode[UCSI_MAX_ALTMODES + 1];
> > >  
> > >         struct typec_capability typec_cap;
> > > 
> > > Though I'm not sure we should need even that. Try it out in any case.
> > > 
> > > Even if that works, I have a feeling there is something odd going on.
> > > What kinds of device has all 30 modes supported (or even more)? I want
> > > to know if this is a case where the firmware is just reporting bogus
> > > values.
> > > 
> > > What device are you plugging to the Type-C connector? Does it really
> > > have all 30 altmodes? What do you see in /sys/class/typec directory
> > > when you connect the device?
> > > 
> > >         ls /sys/class/typec
> > > 
> > > Actually, do this:
> > > 
> > >         grep . /sys/class/typec/port*-partner/port*-partner.*/svid
> > > 
> > > and tell what you get.
> > 
> > Thanks for digging into it, the device being plugged in is a Lenovo TB 
> > dock 
> > (https://www.lenovo.com/ca/en/accessories-and-monitors/home-office/Thunderbolt-Dock-Gen-2-US/p/40AN0135US);
> 
> It has TBT, DP, and probable the Lenovo vendor specific mode. So two
> or three modes, no more, so not 30.
> 
> > thinkpad :: ~ » ls /sys/class/typec
> > port0
> > 
> > thinkpad :: /sys/class/typec » grep . /sys/class/typec/port*-partner/port*-partner.*/svid
> > zsh: no matches found: /sys/class/typec/port*-partner/port*-partner.*/svid
> 
> How can you have partner change notifications without a partner? I'm
> probable still missing something. I wonder what exactly do you have in
> the partner alternate mode array? I think your patche(s) are working
> around some deeper issue. We really need to figure out what that is.
> 
> Let's check the trace output. You need to build the UCSI drivers as
> modules. Then:
> 
>         modprobe -r ucsi_acpi
>         modprobe typec_ucsi
>         mount debugfs -t debugfs /sys/kernel/debug
>         cd /sys/kernel/debug/tracing
>         echo 1 > events/ucsi/enable
>         modprobe ucsi_acpi
> 
> Wait one minute and:
> 
>         cat trace

FYI: The below trace is with the v5 patch i have applied.

# tracer: nop
#
# entries-in-buffer/entries-written: 66/66   #P:8
#
#                              _-----=> irqs-off
#                             / _----=> need-resched
#                            | / _---=> hardirq/softirq
#                            || / _--=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
           <...>-158117 [001] .... 364352.017115: ucsi_register_altmode: port alt mode: svid 17ef, mode 1 vdo 1
           <...>-158117 [001] .... 364352.176246: ucsi_register_port: port0 status: change=5200, opmode=0, connected=0, sourcing=0, partner_flags=0, partner_type=1, request_data_obj=00000000, BC status=1
           <...>-158675 [000] .... 364385.849034: ucsi_connector_change: port0 status: change=5200, opmode=3, connected=1, sourcing=0, partner_flags=2, partner_type=2, request_data_obj=53851545, BC status=1
           <...>-160424 [000] .... 364386.331802: ucsi_register_altmode: partner alt mode: svid 8087, mode 1 vdo ffffffff
           <...>-160424 [000] .... 364386.331840: ucsi_register_altmode: partner alt mode: svid ff01, mode 1 vdo ffffffff
           <...>-160424 [000] .... 364386.448424: ucsi_register_altmode: partner alt mode: svid 8087, mode 2 vdo ffffffff
           <...>-160424 [000] .... 364386.448454: ucsi_register_altmode: partner alt mode: svid ff01, mode 2 vdo ffffffff
           <...>-160424 [000] .... 364386.549487: ucsi_register_altmode: partner alt mode: svid 8087, mode 3 vdo ffffffff
           <...>-160424 [000] .... 364386.549503: ucsi_register_altmode: partner alt mode: svid ff01, mode 3 vdo ffffffff
           <...>-160424 [000] .... 364386.638980: ucsi_register_altmode: partner alt mode: svid 8087, mode 4 vdo ffffffff
           <...>-160424 [000] .... 364386.638998: ucsi_register_altmode: partner alt mode: svid ff01, mode 4 vdo ffffffff
           <...>-160424 [000] .... 364386.746501: ucsi_register_altmode: partner alt mode: svid 8087, mode 5 vdo ffffffff
           <...>-160424 [000] .... 364386.746533: ucsi_register_altmode: partner alt mode: svid ff01, mode 5 vdo ffffffff
           <...>-160424 [000] .... 364386.851931: ucsi_register_altmode: partner alt mode: svid 8087, mode 6 vdo ffffffff
           <...>-160424 [000] .... 364386.851970: ucsi_register_altmode: partner alt mode: svid ff01, mode 6 vdo ffffffff
           <...>-160424 [000] .... 364386.962212: ucsi_register_altmode: partner alt mode: svid 8087, mode 7 vdo ffffffff
           <...>-160424 [000] .... 364386.962243: ucsi_register_altmode: partner alt mode: svid ff01, mode 7 vdo ffffffff
           <...>-160424 [000] .... 364387.081056: ucsi_register_altmode: partner alt mode: svid 8087, mode 8 vdo ffffffff
           <...>-160424 [000] .... 364387.081100: ucsi_register_altmode: partner alt mode: svid ff01, mode 8 vdo ffffffff
           <...>-160424 [000] .... 364387.213591: ucsi_register_altmode: partner alt mode: svid 8087, mode 9 vdo ffffffff
           <...>-160424 [000] .... 364387.213621: ucsi_register_altmode: partner alt mode: svid ff01, mode 9 vdo ffffffff
           <...>-160424 [000] .... 364387.335754: ucsi_register_altmode: partner alt mode: svid 8087, mode 10 vdo ffffffff
           <...>-160424 [000] .... 364387.335770: ucsi_register_altmode: partner alt mode: svid ff01, mode 10 vdo ffffffff
           <...>-160424 [000] .... 364387.446308: ucsi_register_altmode: partner alt mode: svid 8087, mode 11 vdo ffffffff
           <...>-160424 [000] .... 364387.446334: ucsi_register_altmode: partner alt mode: svid ff01, mode 11 vdo ffffffff
           <...>-160424 [000] .... 364387.548723: ucsi_register_altmode: partner alt mode: svid 8087, mode 12 vdo ffffffff
           <...>-160424 [000] .... 364387.548740: ucsi_register_altmode: partner alt mode: svid ff01, mode 12 vdo ffffffff
           <...>-160424 [000] .... 364387.661713: ucsi_register_altmode: partner alt mode: svid 8087, mode 13 vdo ffffffff
           <...>-160424 [000] .... 364387.661792: ucsi_register_altmode: partner alt mode: svid ff01, mode 13 vdo ffffffff
           <...>-160424 [000] .... 364387.765664: ucsi_register_altmode: partner alt mode: svid 8087, mode 14 vdo ffffffff
           <...>-160424 [000] .... 364387.765678: ucsi_register_altmode: partner alt mode: svid ff01, mode 14 vdo ffffffff
           <...>-160424 [000] .... 364387.874643: ucsi_register_altmode: partner alt mode: svid 8087, mode 15 vdo ffffffff
           <...>-160424 [000] .... 364387.874664: ucsi_register_altmode: partner alt mode: svid ff01, mode 15 vdo ffffffff
           <...>-160424 [000] .... 364387.999382: ucsi_connector_change: port0 status: change=1b60, opmode=3, connected=1, sourcing=0, partner_flags=2, partner_type=2, request_data_obj=53851545, BC status=1
           <...>-160424 [000] .... 364422.947503: ucsi_register_altmode: port alt mode: svid 17ef, mode 1 vdo 1
           <...>-160424 [000] .... 364423.323834: ucsi_register_altmode: partner alt mode: svid 8087, mode 1 vdo ffffffff
           <...>-160424 [000] .... 364423.323903: ucsi_register_altmode: partner alt mode: svid ff01, mode 1 vdo ffffffff
           <...>-160424 [000] .... 364423.464644: ucsi_register_altmode: partner alt mode: svid 8087, mode 2 vdo ffffffff
           <...>-160424 [000] .... 364423.464659: ucsi_register_altmode: partner alt mode: svid ff01, mode 2 vdo ffffffff
           <...>-160424 [000] .... 364423.591779: ucsi_register_altmode: partner alt mode: svid 8087, mode 3 vdo ffffffff
           <...>-160424 [000] .... 364423.592074: ucsi_register_altmode: partner alt mode: svid ff01, mode 3 vdo ffffffff
           <...>-160424 [000] .... 364423.717445: ucsi_register_altmode: partner alt mode: svid 8087, mode 4 vdo ffffffff
           <...>-160424 [000] .... 364423.717684: ucsi_register_altmode: partner alt mode: svid ff01, mode 4 vdo ffffffff
           <...>-160424 [000] .... 364423.825988: ucsi_register_altmode: partner alt mode: svid 8087, mode 5 vdo ffffffff
           <...>-160424 [000] .... 364423.826017: ucsi_register_altmode: partner alt mode: svid ff01, mode 5 vdo ffffffff
           <...>-160424 [000] .... 364423.948363: ucsi_register_altmode: partner alt mode: svid 8087, mode 6 vdo ffffffff
           <...>-160424 [000] .... 364423.948425: ucsi_register_altmode: partner alt mode: svid ff01, mode 6 vdo ffffffff
           <...>-160424 [000] .... 364424.059488: ucsi_register_altmode: partner alt mode: svid 8087, mode 7 vdo ffffffff
           <...>-160424 [000] .... 364424.059528: ucsi_register_altmode: partner alt mode: svid ff01, mode 7 vdo ffffffff
           <...>-160424 [000] .... 364424.192603: ucsi_register_altmode: partner alt mode: svid 8087, mode 8 vdo ffffffff
           <...>-160424 [000] .... 364424.192630: ucsi_register_altmode: partner alt mode: svid ff01, mode 8 vdo ffffffff
           <...>-160424 [000] .... 364424.301329: ucsi_register_altmode: partner alt mode: svid 8087, mode 9 vdo ffffffff
           <...>-160424 [000] .... 364424.301373: ucsi_register_altmode: partner alt mode: svid ff01, mode 9 vdo ffffffff
           <...>-160424 [000] .... 364424.428156: ucsi_register_altmode: partner alt mode: svid 8087, mode 10 vdo ffffffff
           <...>-160424 [000] .... 364424.428277: ucsi_register_altmode: partner alt mode: svid ff01, mode 10 vdo ffffffff
           <...>-160424 [000] .... 364424.557797: ucsi_register_altmode: partner alt mode: svid 8087, mode 11 vdo ffffffff
           <...>-160424 [000] .... 364424.557835: ucsi_register_altmode: partner alt mode: svid ff01, mode 11 vdo ffffffff
           <...>-160424 [000] .... 364424.696307: ucsi_register_altmode: partner alt mode: svid 8087, mode 12 vdo ffffffff
           <...>-160424 [000] .... 364424.696379: ucsi_register_altmode: partner alt mode: svid ff01, mode 12 vdo ffffffff
           <...>-160424 [000] .... 364424.806302: ucsi_register_altmode: partner alt mode: svid 8087, mode 13 vdo ffffffff
           <...>-160424 [000] .... 364424.806359: ucsi_register_altmode: partner alt mode: svid ff01, mode 13 vdo ffffffff
           <...>-160424 [000] .... 364424.937869: ucsi_register_altmode: partner alt mode: svid 8087, mode 14 vdo ffffffff
           <...>-160424 [000] .... 364424.937949: ucsi_register_altmode: partner alt mode: svid ff01, mode 14 vdo ffffffff
           <...>-160424 [000] .... 364425.058839: ucsi_register_altmode: partner alt mode: svid 8087, mode 15 vdo ffffffff
           <...>-160424 [000] .... 364425.058856: ucsi_register_altmode: partner alt mode: svid ff01, mode 15 vdo ffffffff
           <...>-160424 [000] .... 364425.181786: ucsi_register_port: port0 status: change=0000, opmode=3, connected=1, sourcing=0, partner_flags=2, partner_type=2, request_data_obj=53851545, BC status=1
---1463810553-973498883-1599790433=:31932--
