Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAFD4CBC2C
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 15:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388916AbfJDNsD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 09:48:03 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46809 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388897AbfJDNsA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Oct 2019 09:48:00 -0400
Received: by mail-qk1-f195.google.com with SMTP id 201so5788474qkd.13
        for <linux-usb@vger.kernel.org>; Fri, 04 Oct 2019 06:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AgRoX3J9qaFKW7Faaca6EzPdIWH93zdGSqSeSjREq9E=;
        b=RWCJUBkPHtz1d7NmAq9CSNbNzakLFjGiqZ510lmDjqX+yg0CWBc6ssCWXC1l+EOTLo
         39yxqZNju/zwMGuW7vfcLE9NdxX02VAeXuvbpDzmR8ye71QAfGfZB9koN2O1u7nmDfqA
         OlhHegh0N+d5TepwPtJr2x0vu2MnHlcA6wMXoVDm7kuIU7y+JNxAbhVOH0uMn38FFvjA
         YPXEd85Hdnn6NfFYqVukIlhQTAdW1f285dVXilwiDXGP0HK2OTA0onDP7kJv+gdyi6hn
         e3R55zS/aOQlXG5ZVBm2bXvsFuIw2mwsSHElejMPRg3Vs8UQtVN6OD1fIUiCJ4z3q2l8
         CSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AgRoX3J9qaFKW7Faaca6EzPdIWH93zdGSqSeSjREq9E=;
        b=C3hJ6pQ9KwOBqyjYwAQM0QPWOi7WARmLjxUZO5eVYxYkyoUgo0+bmL88PkL0a+4ZKz
         72TLs4AcVaWJylrz3Xi+p9zuUIxqVWS20a1XTGoUaSpaq1vF2aDYKMDvj1eQihZemPl6
         pj8kkVkCBerCaX0gSnmBIDtiYvhf+TWODeCohK2q/ZYxGREObtrYyD0croAe1M3ThQ4U
         cjf0cJiZM5Z0PWuKMacS6yjCPMNQdOpaupI+qnyOALxKZrcbOPWyjf9f80FE9WQY+i4V
         KWBKQysS+MpTSym7lOXLpJnHxRdGYE/UdRvAAj0GLoiPtIpoNs83Ve/VHZ6KJUmMakxs
         thqw==
X-Gm-Message-State: APjAAAXs3aYf/ppFWDI1yu/JZvENC6u5bgIX/N2v2bI4+c4ChZq5PIGe
        JXQyfuTibpi0bzWNujaZuWnABprp/KSMCFmw1OEwEA==
X-Google-Smtp-Source: APXvYqyoQV3LB8JuP6Y0qz5e58jlYzcikcE2Rfvef6ZR/EIFP2lAlJ2EG01V5FWOV8i1nICdYmVrzGRfEMRHBsLVRoE=
X-Received: by 2002:a37:5cc1:: with SMTP id q184mr10259974qkb.212.1570196878408;
 Fri, 04 Oct 2019 06:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190920032437.242187-1-kyletso@google.com> <bd03390e-35fb-2885-d026-b8df58f02283@redhat.com>
 <CAGZ6i=1mid0Cq2EtWTJHwRzPxXZJnLtTWwYL2QS0vZHNR9mJqQ@mail.gmail.com> <f7f50c17-976c-475e-4ea0-b8660331d4cd@redhat.com>
In-Reply-To: <f7f50c17-976c-475e-4ea0-b8660331d4cd@redhat.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Fri, 4 Oct 2019 21:47:42 +0800
Message-ID: <CAGZ6i=2F-7K=Mpcj+2WYjDynmLEC5XR_yJdfHjjb81rPZ58i+A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] tcpm: AMS and Collision Avoidance
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hans,

It seems that there is a bug in the patch. Thank you for catching this!
I will revise the patch and upload it again.





On Thu, Oct 3, 2019 at 6:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 03-10-2019 12:04, Kyle Tso wrote:
> > Hi Hans
> >
> > Could you append the TCPM log?
>
> I've attached both good and bad logs, both start with plugging in
> one of these PD charging pass-through + USB-3 + HDMI out dongles.
>
> at a quick glance the problem
> seems to be that with the 2 AMS patches added we stop transmitting
> after:
>
> [  137.751964] Rx VDM cmd 0xff018144 type 1 cmd 4 len 1
>
> Where as the good logs still transmits (and receives) a couple of
> packets extra after this:
>
> [ 4475.965108] Rx VDM cmd 0xff018144 type 1 cmd 4 len 1
> [ 4475.965224] PD TX, header: 0x2f6f
> [ 4475.968979] PD TX complete, status: 0
> [ 4475.980811] PD RX, header: 0x2a4f [1]
> [ 4475.980816] Rx VDM cmd 0xff018150 type 1 cmd 16 len 2
> [ 4475.980929] PD TX, header: 0x216f
> [ 4475.984093] PD TX complete, status: 0
> [ 4475.996798] PD RX, header: 0x1c4f [1]
> [ 4475.996803] Rx VDM cmd 0xff018151 type 1 cmd 17 len 1
>
> Regards,
>
> Hans
>
>
> >
> > On Thu, Oct 3, 2019 at 5:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi Kyle,
> >>
> >> On 20-09-2019 05:24, Kyle Tso wrote:
> >>> *** BLURB HERE ***
> >>>
> >>> Kyle Tso (2):
> >>>     usb: typec: tcpm: AMS and Collision Avoidance
> >>>     usb: typec: tcpm: AMS for PD2.0
> >>
> >> I've finally gotten a chance to test this on one of my own devices
> >> which uses the tcpm framework for its Type-c port.
> >>
> >> I am afraid that this series breaks DP altmode support,
> >> specifically, the dp_altmode_configure() function no longer
> >> seems to get called, leading to no pin-assignment being
> >> selected by default and DP thus not working.
> >>
> >> So sorry, but I have to NACK this series since it causes
> >> regressions.
> >>
> >> It might be easiest if you can get yourself some hardware
> >> which supports DP altmode and uses the fusb302 Type-C
> >> controller (which unlike your controller is actually
> >> supported by the mainline kernel).
> >>
> >> 2 devices which have this are the original (version 1)
> >> of the GPD win and the GPD pocket. Since the version
> >> is not always clearly marked, make sure you get one which
> >> has a X7-Z8750 CPU, those are the version 1 models, you
> >> can still get these e.g. here:
> >>
> >> https://www.geekbuying.com/item/GPD-Pocket-7-Inch-Tablet-PC-Intel-Atom-X7-Z8750-8GB-128GB-375711.html
> >> https://www.geekbuying.com/item/GPD-Win-Intel-Z8750-Windows-10-4GB-64GB-Gamepad-Tablet-PC---Black-378018.html
> >>
> >> These 2 devices still need 2 minor patches to hookup the DP
> >> support, I have just finished these 2 patches up and I'm
> >> submitting them upstream today, I will Cc you on these.
> >>
> >> If you combine these with one of the many DP-charging pass-through
> >> + USB-3 out + HDMI out dongles, e.g.:
> >> https://www.aliexpress.com/item/32953320909.html
> >>
> >> And then after plugging in do:
> >>
> >> cat /sys/class/typec/port0-partner/port0-partner.0/displayport/pin_assignment
> >>
> >> This should print:
> >>
> >> C [D]
> >>
> >> But when I add your patches into the mix it prints just:
> >>
> >> C D
> >>
> >> And these debug pr_err calls never happen:
> >>
> >> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> >> index 7845df030b72..d14f94078dd9 100644
> >> --- a/drivers/usb/typec/altmodes/displayport.c
> >> +++ b/drivers/usb/typec/altmodes/displayport.c
> >> @@ -106,6 +106,7 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
> >>                  break;
> >>          }
> >>
> >> +       pr_err("dp_altmode_configure pin_assign %08x conf %08x\n", pin_assign, DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
> >>          /* Determining the initial pin assignment. */
> >>          if (!DP_CONF_GET_PIN_ASSIGN(dp->data.conf)) {
> >>                  /* Is USB together with DP preferred */
> >> @@ -115,6 +116,8 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
> >>                  else if (pin_assign & DP_PIN_ASSIGN_DP_ONLY_MASK)
> >>                          pin_assign &= DP_PIN_ASSIGN_DP_ONLY_MASK;
> >>
> >> +               pr_err("dp_altmode_configure masked pin_assign %08x\n", pin_assign);
> >> +
> >>                  if (!pin_assign)
> >>                          return -EINVAL;
> >>
> >>
> >> Regards,
> >>
> >> Hans
> >>
