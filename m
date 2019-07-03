Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 895685EDA3
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 22:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbfGCUeV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 16:34:21 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:39105 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbfGCUeV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jul 2019 16:34:21 -0400
Received: by mail-lj1-f182.google.com with SMTP id v18so3851620ljh.6
        for <linux-usb@vger.kernel.org>; Wed, 03 Jul 2019 13:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=esmbGIK2+TRUCl5zAQF1Uk4NOAeqwC8H/Gxq83rEAY0=;
        b=M6dRfOHE5kwH8q20HBto8Yvj3xMjePzLKssvqkvjEka8IdCc+I6rBZazpdaGrb/YXD
         awNIEIEwHuTOogQgRMLbfvTXhnnb8r/RJfFuCBXuiNp7GJuY4d29gRyPFxQvPM5KcsOr
         nbUD9MTDo4+NMYNVWktpsrx8GrQrAhg47oPCMbo0nKdTGGx68ttCTqkwJPpxUdcwkD8j
         3P0AOo5D1V0r6pv26B7sY7h1rBGCDTgpNqYWFJLe0HiouaVhThLGCFBaEph8RUdsoiID
         hRxANfqbiOkcI+igmZCkkhgGKMutGTWiN/keptvfK6oOQcH+Z4O1908FjrWznYRJ8WiU
         MlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=esmbGIK2+TRUCl5zAQF1Uk4NOAeqwC8H/Gxq83rEAY0=;
        b=M4FfGmv2AyQAPJ3UxT2x+Dyr5pZ3RWuKnJKAnev719HRN/1IhUryewHv3TROLkGQUY
         j2O6TXTxoBEZRFQgQHwv4A9aRqUiycW4rfl1W3vLI5xXR6qVetCHkjATLODDLsOBxN6Z
         H5FT2qkAG+uGrsNxJASfIZAhvPBsbJLavCf083eq/6rSsKtzotTCNLihU34rxqqf4d3M
         SHVsh8gURdwz7mBMk1ZcsbYrDEH2V4Voy1QtGc3/PVGQcf+EyZB5mLuveaA1PMNvI5Au
         1tEVmX55LZ7l8e6nbJmKIGDp5OYQ4DW57eA0eKUXrkI8mUJfBQB0jWN/fXwK5cmKWer9
         haJA==
X-Gm-Message-State: APjAAAW5qhhHSmuasGKJdn76k4r6OtKl6uIgjEebewKbpWZU8B9siyp1
        wUnSFH4fDGNyQ1iiiKlvkqHD06w7Y+4=
X-Google-Smtp-Source: APXvYqynokKKgaYILb1BTpMt3bFk3/r8odov0+bb0Z53yl/EQoO5WLChzuOLEp4p1KQ75V6CPoKsgw==
X-Received: by 2002:a2e:a0d6:: with SMTP id f22mr687467ljm.182.1562186058955;
        Wed, 03 Jul 2019 13:34:18 -0700 (PDT)
Received: from [192.168.1.60] (0126800801.0.fullrate.ninja. [2.110.44.75])
        by smtp.gmail.com with ESMTPSA id h22sm661187ljj.105.2019.07.03.13.34.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 13:34:17 -0700 (PDT)
Message-ID: <847524769f1229b1a96d5ccea53c999497dccfff.camel@gmail.com>
Subject: Re: Clarification of set_sel handling when dwc3 is a device (gadget)
From:   claus.stovgaard@gmail.com
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>,
        Rob Weber <rob@gnarbox.com>
Date:   Wed, 03 Jul 2019 22:34:16 +0200
In-Reply-To: <CY4PR1201MB0037D801D920ACAD8B4CF3B6AAF90@CY4PR1201MB0037.namprd12.prod.outlook.com>
References: <6dbe8df06875947d7ea6d6a21f83ac68315c0ef4.camel@gmail.com>
         <CY4PR1201MB0037D801D920ACAD8B4CF3B6AAF90@CY4PR1201MB0037.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On man, 2019-07-01 at 20:48 +0000, Thinh Nguyen wrote:
> Hi,
> 
> 

> > ----
> > reg = dwc3_readl(dwc->regs, DWC3_DCTL);
> > if (reg & DWC3_DCTL_INITU2ENA)
> > 	param = dwc->u2pel;
> > if (reg & DWC3_DCTL_INITU1ENA)
> > 	param = dwc->u1pel;
> 
> This is incorrect. If the controller is enabled for both U1 and U2,
> then
> periodic param is U2PEL. If the controller is only enabled for U1,
> then
> U1PEL is used. Probably the original author intended but missed the
> "else" on the second if case.
> 
> 
> According to the databook, currently the controller doesn't use these
> programmed values. It uses the value from CoreConsultant
> configuration
> setting.
> 

Thanks for your quick reply.

So my understanding from your message is that the code is wrong, and I
was correct in being puzzled. Though the core currently does not use
the values, so currently the code is unimportant as it is unused by the
hardware.

Regards
Claus


> BR,
> Thinh

