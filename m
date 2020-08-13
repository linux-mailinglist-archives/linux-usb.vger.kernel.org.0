Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B01243F63
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 21:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgHMTkn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 15:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgHMTkm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Aug 2020 15:40:42 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68939C061757
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2020 12:40:42 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id v20so1994005ual.4
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2020 12:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fYIbVh3/szn+XzzaL9yiDzfDpyZxulF6xv5AQpsf1tY=;
        b=IfWJSMRBSPVM6hOXnA7qZrjX5syp4z2F5c/a0ybY32nxgmyWYvJC3PnC//hObz1GIq
         JCX1cS1T0JzkjuTXRwlu8hgGdfyv+RMeJMcn8VkVtke7FGmUXeFeXUyJCes9uF/nxuWM
         aEWDJQKHXJ5zKrxqIqRsl8RiNiNsfYYnvlya0qKajyxOLIpkfeU9uY6vphwL1JojH8VB
         AKaMCvPfk3ERZRTPZKATnMCdjy7K+dousuKogn9nD7BZZkZsaC6yBTC1vUr0Tp2j4EQr
         K5NVgdb3+3V4NH8dPRnmPq2nDbprDE/GdDEDsxgKpWaRuIC8aT/X98QeERIsZv0FjEyo
         t6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fYIbVh3/szn+XzzaL9yiDzfDpyZxulF6xv5AQpsf1tY=;
        b=p1pCD/Jclj6uuxqho/TXX1mZPgSHqAjhqIzuTq26iiCa/yBFGnIpQKwBtctZ1WR4/z
         /Zvbhp5vO+IoCEifwlFwx9WJ+0PNe1G6jU+u2DeAjf03cfm7Pxb4/T+AcEt34v9ts0Po
         ISOpomoSnvARq59Ct42JTMcNxI6NE0lnTC5mexHGtiPtmF2kcSMale14gmSgeBQ73CmP
         b3CtySV+Jk9V53jgBkaNAlyKQSK3/Vl4eXCuPEmKcfoQcCoOdIVkfOpWhZ+6ok8CUXR8
         0wRz5Hc0zHqcswjw91Ko+k+m95qeiTlQ6JHuE1s2vbM5TEk6+lDRMDQTZLKIBjOJ+bTE
         mrAQ==
X-Gm-Message-State: AOAM533lbygTtP7UVbzzdeHbMADJxINO5+GkE8t5l2MIgv1vlRIcSCB0
        dPPOcGeho0idIcWbphgQDgL/OOgELDX279cESjOGBwQ99xbb0g==
X-Google-Smtp-Source: ABdhPJxfOCn7KR3p+zSEbGdL5eE4T5BBbTrT9qk60O4S7asbIPLShiHuIStsMj7Da9/K5beKHDXZecy/X0O6gp5r6js=
X-Received: by 2002:ab0:69d6:: with SMTP id u22mr4804520uaq.65.1597347640377;
 Thu, 13 Aug 2020 12:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200812022934.568134-1-badhri@google.com> <20200813082507.GE1169992@kuha.fi.intel.com>
In-Reply-To: <20200813082507.GE1169992@kuha.fi.intel.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Thu, 13 Aug 2020 12:40:04 -0700
Message-ID: <CAPTae5KUdTN5fVn45xFwhWS5Gy_xFJ91gAObb7qMk2KA+n72yQ@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] tcpm: During PR_SWAP, source caps should be sent
 only after tSwapSourceStart
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Sure. Same as the other patch I will try to address your question here
and will update the commit description once you are satisfied with the
description.

Subject:
During PR_SWAP, source caps should be sent only after tSwapSourceStart

Commit description:
The patch addresses the compliance test failures while running
TD.PD.CP.E3, TD.PD.CP.E4, TD.PD.CP.E5 of the "Deterministic PD
Compliance MOI" test plan published in https://www.usb.org/usbc.
For a product to be Type-C compliant, it's expected that these tests
are run on usb.org certified Type-C compliance tester as mentioned in
https://www.usb.org/usbc.

The purpose of the tests TD.PD.CP.E3, TD.PD.CP.E4, TD.PD.CP.E5 is to
verify the PR_SWAP response of the device. While doing so, the test
asserts that Source Capabilities message is NOT received from the test
device within tSwapSourceStart min (20 ms) from the time the last bit
of GoodCRC corresponding to the RS_RDY message sent by the UUT was
sent. If it does then the test fails.

This is in line with the requirements from the USB Power Delivery
Specification Revision 3.0, Version 1.2:
"6.6.8.1 SwapSourceStartTimer
The SwapSourceStartTimer Shall be used by the new Source, after a
Power Role Swap or Fast Role Swap, to ensure that it does not send
Source_Capabilities Message before the new Sink is ready to receive
the
Source_Capabilities Message. The new Source Shall Not send the
Source_Capabilities Message earlier than tSwapSourceStart after the
last bit of the EOP of GoodCRC Message sent in response to the PS_RDY
Message sent by the new Source indicating that its power supply is
ready."

The patch makes sure that TCPM does not send the Source_Capabilities
Message within tSwapSourceStart(20ms) by transitioning into
SRC_STARTUP only after  tSwapSourceStart(20ms).

Thanks,
Badhri

On Thu, Aug 13, 2020 at 1:25 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi,
>
> > This fixes TD.PD.CP.E3, TD.PD.CP.E4, TD.PD.CP.E5 failures
>
> I'm sorry, but that statement is way too cryptic. You really need to
> explain what those are.
>
> thanks,
>
> --
> heikki
