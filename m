Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5117C1D2AB4
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 10:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgENIx3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 04:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725935AbgENIx1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 04:53:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B30C061A0C
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 01:53:26 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e16so2803832wra.7
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 01:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MOWN8vXdYBg2DANlbCMNBiEfJc7QjgwHTr3ZjwyNWJE=;
        b=kAdRhnukZJOKcSr+DxZ3oe07bTXfGzZDQafwVIXxAENdOlmerkAKScMbwVPgv/G45u
         ya8mj1etscUR2txqS4DqZicCrIxeCLJ7Ra4SvCQVytpz3rXSSbN0PCUZ4neFVYOANl4a
         kmTfrQDFPvwxXgpVOO9dXgfkf8xM9tH48yXfKFS+J76KH3zkQ8/h5CakKNp7rs6s0iWv
         guHZk7exQ25MTttzEYyqTScHOrywFALJ48dYageH+oe5DkUhwfud4GPL77xKm672lgmV
         uxb0NqXSXr3GCVMJLBkVPY6UMYB1oFttOae3EoEKXp4SrcxUDd0R8QMsKKlY4+jjnzVt
         +FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MOWN8vXdYBg2DANlbCMNBiEfJc7QjgwHTr3ZjwyNWJE=;
        b=fFN0FobpPYRymkOu0HZQafAtC1BLzi0wo63TXPcdv2HxHcTJBa4XyYRYCqVlQlS8wz
         gyw8aCTcP/72wmsJErz2LOFBIaSWNDlSc4FXITWx3rT93CGbfnb/TrAZHOXsRjfPTFlB
         hTFl47X2Rjrb0OhgMMe1kwV9egpmxpi67UAf0Ll8wqv9bXgAif/+Fz03FTg9jW9EczQ6
         i7pdTLafhnaaYem35a+2l+9KeVD4EK65WkF3kojtHHY+rozoUCwDWefaTwXFIeGIVvG5
         NbVvR6IbiRyK5dRMPhogzdVE1r13b3d7tZ9WR+eQNjEdMuXYA6CXEISK4+elNma6UxA/
         lg5g==
X-Gm-Message-State: AOAM532xFAtxlo3b9hN2PAbBJIhC13ja8NjtzHvjSyBQsIGeHU2R+I4M
        VC0NVsKfaMyEqGdf6cn33sc=
X-Google-Smtp-Source: ABdhPJwOZN2DmRfNoMat0SjTpYv7uoYC2lBzYG7fxIaHE/KjRonVKyHpb7ALWCHUxB+1FqQ1Cs1OTA==
X-Received: by 2002:adf:9d91:: with SMTP id p17mr4002655wre.119.1589446405007;
        Thu, 14 May 2020 01:53:25 -0700 (PDT)
Received: from [192.168.1.41] (2-108-107-206-static.dk.customer.tdc.net. [2.108.107.206])
        by smtp.gmail.com with ESMTPSA id t22sm9379631wmj.37.2020.05.14.01.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 01:53:24 -0700 (PDT)
Message-ID: <e44a96cff9bee0b9f47c82d05461570d47d96177.camel@gmail.com>
Subject: Re: Options for forcing dwc3 gadget to only accept superspeed
From:   Claus Stovgaard <claus.stovgaard@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Thu, 14 May 2020 10:53:23 +0200
In-Reply-To: <87k11gp9t4.fsf@kernel.org>
References: <8943a225c6d8354f2f5fe0ea7270dc0fa1293180.camel@gmail.com>
         <20200512195231.GA26080@rowland.harvard.edu>
         <6d19d49dcfe7467556b0462b16e76677c1999875.camel@gmail.com>
         <87k11gp9t4.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On ons, 2020-05-13 at 10:34 +0300, Felipe Balbi wrote:
> 
> If it's "ending in super-speed" this means it tried RX.Detect and it
> failed, thus falling back to high-speed. It's likely that the signal
> quality in your setup has degraded or is, at least, sub-par.
> 
> Forcing a SS-only setup would just give you a device that doesn't
> even
> enumerate in some cases.
> 
> Could you capture dwc3 tracepoints of the problem?
> 
> Also, which kernel version are you running? Which platform?
> 

Thanks for you reply Balbi.

Will start with from the back. The kernel is 4.19 in the xilinx version
- https://github.com/Xilinx/linux-xlnx
It is running on a ZynqMP from Xilinx, where we are using the build in
Cirrus SERDES as phy. In front of the phy is a tusb1042i redriver/mux
and a Cypress CCG4 as type-c controller for handling the redriver/mux.

Regarding signal integrity - it is on my radar. I know from experience
that noise on the GND in the cable can highly influence signal
integrity on the super speed pair in some situations, even though it is
shielded.

I am currently working on a setup with a Beagle USB analyzer, together
with dwc3 tracepoints, and automatically disconnect and connect the
USB. Would like to have both the USB analyzer version of what happening
on the bus, together with the dwc3 handling.

It just takes some time to create this test setup (need to do some
python code for controlling the Beagle and the device), so it will take
some time before I can have any data. 

So my email is also kind of an brainstorm for what kind of options
there exist in the dwc3 to control how it falls back to high-speed.

Regards
Claus

