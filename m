Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E671243F31
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 21:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgHMTLM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 15:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMTLM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Aug 2020 15:11:12 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8BFC061757
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2020 12:11:11 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id g20so1972535uan.7
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2020 12:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hVfowbxzyxcugBKoGU08vmnN0a1YFEFi/I55w6LvOjw=;
        b=rzNOCF5+okDp7MgI4wWWGs7h4ZqC5YuJm8HrIm+aegeBO+RVWmMawYdmtAiCG/JqLy
         yoCHcD9nOH3olLgc3O1XXlA4ntf2gV5sZ66NQen+J/9Z2a1fsruQax1uSVgp97FSLt6/
         x/DDEmIcYuZjTCiHumYKqaG/HxkfgpCYVk1lnijPub2O6zrngIyfk/jciQWZ0NOnuvnp
         w0IuoP9qTjhNm/Ol11KRDEbO0VW0NKljwaYRqyMKq+kxhhX7XdB85nhnaFqLOSY+oMsx
         HkJr5uw/QYrHjXWT+BIHu/4TFVPnNHppPFr+lyIUMDTRsgWi+Yz9STiL2qakwSs3N3uq
         6yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hVfowbxzyxcugBKoGU08vmnN0a1YFEFi/I55w6LvOjw=;
        b=TKnS7jtCGGPrTnH8bidCcyb+ibZlxs49o9rv6R0YrEK1ZCvYtfSlyaYo4HVzYu8iNH
         woMX7++lcE7xVlbMWJkzF9KYkexGlfmTDO6MD4HMjfQoJu2q0vWP6iyRDmC1A3WTqI34
         WdykJd2F2uW1p60u2x5hA7xIdnUmZX9kDKwG7x17XzvzL64M8hgGEQN+81tzdeN/+TF7
         htA4T9araUezIcBR3G3HUAzVM/NVPfqjvZQ6mlblNhdOQ3dhbdmZUuE7PrtPnIFRuPgL
         7EX3Dh8Z2ErFxAAE/DSG0FGjQK88bmftEo5R1lxpYtqT5/rNuxSSFB//eRpFjJIPhPjB
         +Dzg==
X-Gm-Message-State: AOAM530K4tWLErUwmdU3Us2XNOwjYLeLxKbjlzqTs1UabNjPP3VmtTNO
        YTqaZanFbVi1J9+25be7eANBYifV3DaawvWjQqASqwy1dOFpjw==
X-Google-Smtp-Source: ABdhPJxc65Y65uElvHy4LUQs8ZA0GDLB34E7kKC24LDwWyGw+Ek3o17KmckyBvb9nAk6pbYHnrN6pahvT5wpc7G8VsQ=
X-Received: by 2002:ab0:69d6:: with SMTP id u22mr4727761uaq.65.1597345870549;
 Thu, 13 Aug 2020 12:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200812025126.574519-1-badhri@google.com> <20200813080821.GD1169992@kuha.fi.intel.com>
In-Reply-To: <20200813080821.GD1169992@kuha.fi.intel.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Thu, 13 Aug 2020 12:10:34 -0700
Message-ID: <CAPTae5+JhkBM3fY3Gyn6tXLjV-TwY7DaOdRvm8+Ls3WtHeOyBQ@mail.gmail.com>
Subject: Re: [PATCH v3] usb: typec: tcpm: Fix TDA 2.2.1.1 and TDA 2.2.1.2 failures
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Sure. I will try to address your question here and will update the
commit description once you are satisfied with the description.
However, I have to quote the spec as spec is the source of truth. But,
I will try to link to code.
I corrected the test case numbers as well.

Subject:
Fix source hard reset response

Commit description:
The patch addresses the compliance test failures while running  TDA
2.3.1.1 and  TDA 2.3.1.2 of the "PD Communications Engine USB PD
Compliance MOI" test plan published in https://www.usb.org/usbc.
For a product to be Type-C compliant, it's expected that these tests
are run on usb.org certified Type-C compliance tester as mentioned in
https://www.usb.org/usbc.

While the purpose of TDA 2.3.1.1 and  TDA 2.3.1.2 is to verify that
the static and dynamic electrical capabilities of a Source meet the
requirements for each PDO offered,  while doing so, the tests also
monitor that the timing of the VBUS waveform versus the messages meets
the requirements for Hard Reset defined in PROT-PROC-HR-TSTR as
mentioned in step 11 of TDA.2.3.1.1 and step 15 of TDA.2.3.1.2.

TDB.2.2.13.1: PROT-PROC-HR-TSTR Procedure and Checks for Tester
Originated Hard Reset
Purpose: To perform the appropriate protocol checks relating to any
circumstance in which the Hard Reset signal is sent by the Tester.

UUT is behaving as source:
The Tester sends a Hard Reset signal.
1. Check VBUS stays within present valid voltage range for
tPSHardReset min (25ms) after last bit of Hard Reset signal.
[PROT_PROC_HR_TSTR_1]
2. Check that VBUS starts to fall below present valid voltage range by
tPSHardReset max (35ms). [PROT_PROC_HR_TSTR_2]
3. Check that VBUS reaches vSafe0V within tSafe0v max (650 ms).
[PROT_PROC_HR_TSTR_3]
4. Check that VBUS starts rising to vSafe5V after a delay of
tSrcRecover (0.66s - 1s) from reaching vSafe0V. [PROT_PROC_HR_TSTR_4]
5. Check that VBUS reaches vSafe5V within tSrcTurnOn max (275ms) of
rising above vSafe0v max (0.8V). [PROT_PROC_HR_TSTR_5] Power Delivery
Compliance Plan 139 6. Check that Source Capabilities are finished
sending within tFirstSourceCap max (250ms) of VBUS reaching vSafe5v
min. [PROT_PROC_HR_TSTR_6].

This is in line with 7.1.5 Response to Hard Resets of the USB Power
Delivery Specification Revision 3.0, Version 1.2,
"Hard Reset Signaling indicates a communication failure has occurred
and the Source Shall stop driving VCONN, Shall remove Rp from the
VCONN pin and Shall drive VBUS to vSafe0V as shown in Figure 7-9. The
USB connection May reset during a Hard Reset since the VBUS voltage
will be less than vSafe5V for an extended period of time. After
establishing the vSafe0V voltage condition on VBUS, the Source Shall
wait tSrcRecover before re-applying VCONN and restoring VBUS to
vSafe5V. A Source Shall conform to the VCONN timing as specified in
[USB Type-C 1.3]."

With the above guidelines from the spec in mind, TCPM does not turn
off VCONN while entering SRC_HARD_RESET_VBUS_OFF. The patch makes TCPM
turn off VCONN while entering SRC_HARD_RESET_VBUS_OFF and turn it back
on while entering SRC_HARD_RESET_VBUS_ON along with vbus instead of
having VCONN on through hardreset.

Also, the spec clearly states that "After establishing the vSafe0V
voltage condition on VBUS",  the Source Shall wait tSrcRecover before
re-applying VCONN and restoring VBUS to vSafe5V.
TCPM does not conform to this requirement. If the TCPC driver calls
tcpm_vbus_change with vbus off signal, TCPM right away enters
SRC_HARD_RESET_VBUS_ON without waiting for tSrcRecover.
For TCPC's which are buggy/does not call tcpm_vbus_change, TCPM
assumes that the vsafe0v is instantaneous as TCPM only waits
tSrcRecover instead of waiting for tSafe0v + tSrcRecover.
This patch also fixes this behavior by making sure that TCPM waits for
tSrcRecover before transitioning into SRC_HARD_RESET_VBUS_ON when
tcpm_vbus_change is called by TCPC.
When TCPC does not call tcpm_vbus_change, TCPM assumes the worst case
i.e.  tSafe0v + tSrcRecover before transitioning into
SRC_HARD_RESET_VBUS_ON.

Thanks,
Badhri


On Thu, Aug 13, 2020 at 1:08 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi,
>
> On Tue, Aug 11, 2020 at 07:51:26PM -0700, Badhri Jagan Sridharan wrote:
> > >From the spec:
> > "7.1.5 Response to Hard Resets
> > Hard Reset Signaling indicates a communication failure has occurred and
> > the Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin
> > and Shall drive VBUS to vSafe0V as shown in Figure 7-9. The USB connection
> > May reset during a Hard Reset since the VBUS voltage will be less than
> > vSafe5V for an extended period of time. After establishing the vSafe0V
> > voltage condition on VBUS, the Source Shall wait tSrcRecover before
> > re-applying VCONN and restoring VBUS to vSafe5V. A Source Shall conform
> > to the VCONN timing as specified in [USB Type-C 1.3]."
>
> I really think you need to explain the patch at least a little.
> Consider people who don't understand that much about USB PD. Open it
> up somehow instead of just quoting the spec.
>
> Can you please start by explaining what exactly is TDA 2.2.1.1 and TDA
> 2.2.1.2. Perhaps you could also consider a better subject line for
> this?
>
> thanks,
>
> --
> heikki
