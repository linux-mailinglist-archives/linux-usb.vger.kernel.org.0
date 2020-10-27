Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACE229CAEB
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 22:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1832051AbgJ0VH6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 17:07:58 -0400
Received: from z5.mailgun.us ([104.130.96.5]:64491 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1832049AbgJ0VH6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 17:07:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603832877; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=67K6RJoqZV4jV6Lirkgyf0OeKqOsK/gu9ZFcUIk2CVA=; b=AG7K8vOF/KmwfLzqUM1M+FJ1bTkZ8qijnZ5hrPUNNGFejh9DkyOSjvvH/CPeteQUwbVD80I2
 zLOMdfsBsIdlqHcZKWQK8Xwn4giYoR1K7tOSQkmdX0xZK6NlZ9BNtLk67Os4cuvvHQ6Tn48i
 1gc1mianb51+TULQBqIx5z4xkrM=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f988bedda4f464773e2bcb1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Oct 2020 21:06:53
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D13D1C433F0; Tue, 27 Oct 2020 21:06:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C266C433C9;
        Tue, 27 Oct 2020 21:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9C266C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Tue, 27 Oct 2020 14:06:48 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Ferry Toth <fntoth@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        felipe.balbi@linux.intel.com,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Message-ID: <20201027210648.GB26640@jackp-linux.qualcomm.com>
References: <874kmpf583.fsf@kernel.org>
 <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
 <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
 <2b6586e6-528c-86e8-9d92-0061bc44866d@gmail.com>
 <aad327a8-95bc-40ec-abf7-ad216a02fad0@synopsys.com>
 <2cc783ac-6b71-190b-49fc-9e2bceeacd4b@gmail.com>
 <920590dc-5430-7f8b-b2e1-1a4c37f4dfbe@synopsys.com>
 <CAHp75Vfs9AoOYSVGTpw30h11ptPOSPNf1AsWBKdiVrDL=9X3PQ@mail.gmail.com>
 <0089306e-e2ca-9a53-6ffb-202d028050ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0089306e-e2ca-9a53-6ffb-202d028050ce@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ferry,

On Tue, Oct 27, 2020 at 09:13:31PM +0100, Ferry Toth wrote:
> Hi guys,
> 
> Sorry for messing up the CC list. This was partly thanks to gmane, partly my
> own stupidity. I hope it is complete now.
> 
> I am summarizing the status of this one at the bottom.
> 
> Op 22-10-2020 om 15:43 schreef Andy Shevchenko:
> > On Thu, Oct 22, 2020 at 4:21 PM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> > > Ferry Toth wrote:
> > > > Op 21-10-2020 om 21:50 schreef Thinh Nguyen:
> > > > > Ferry Toth wrote:
> > ...
> > 
> > > > > Oops, looks like I can't make it synchronous this way. Can you try
> > > > > Jack's change to the u_audio.c instead?
> > > > Oops indeed goes away with Jack's change, but usb connection goes
> > > > up/down continuously, meaning: my host sees usb network and audio
> > > > device appearing / disappearing.
> > > Ok, thanks for verifying that it went away.
> > > 
> > > > mass_storage device does not appear all.
> > > There are some fixes to dwc3 in kernel mainline. Is it possible to test
> > > this against linux-next?
> > I think the best is to wait for v5.10-rc1 and retest.
> > 
> I looks like there have been at least 3 problems:
> 
> 1) dwc3 was not working in host mode, but not causing an oops. This may have
> been caused by platform changes. Andy has provided a fix for this, dwc3 now
> working in host mode on 5.9
> 
> 2) dwc3 was causing the oops in gadget mode as referenced in this thread.
> The experimental patch from Jack Phan indeed fixes this.
> 
> Code here: https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0

Great, thanks! I'll submit the patch to the list. Is it alright if I
add a Reported-and-tested-by tag from you?

> 3) With the above 2 fixes gadgets work but seem to be powered down (after 15
> sec. or so) and up (after 1 sec.) continuously. No oops, no errors in
> journal. The gadgets I enabled are a network, sound and mass storage. The
> latter stops working due to going up/down quickly. But my host shows
> network/sound appearing/disappearing. Journal of edison shows:
> 
> systemd-networkd[525]: usb0: Gained carrier
> systemd-networkd[525]: usb0: Gained IPv6LL
> systemd-networkd[525]: usb0: Lost carrier
> systemd-networkd[525]: usb0: Gained carrier
> systemd-networkd[525]: usb0: Gained IPv6LL
> systemd-networkd[525]: usb0: Lost carrier
> 
> Any ideas how to proceed are highly welcomed!

I suppose you can start with enabling dwc3 trace events and try to see
what's going on from the gadget side. Please refer to
Documentation/driver-api/usb/dwc3.rst **Reporting Bugs**

Also what happens if you enable the network, sound and mass storage
functions individually rather than all at once (assuming you are using
ConfigFS)?

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
