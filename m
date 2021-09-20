Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25254113C0
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 13:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237275AbhITLtQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 07:49:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237371AbhITLtN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 07:49:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3872A60FED;
        Mon, 20 Sep 2021 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632138466;
        bh=dRbvVwTqXOM0lSL7IAKq5/DhxWoeDCAtnCtd4tGRFsU=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=DdywjbU6m9JCe83c4qyW6e6G3xri0mIHCDxV3RlTkRrROAawWcttytpvAesTsMfox
         YN2BgygA8hd2w1j/O/mhf48TMShQnJkNgY0rqcZkac3RJ0QephuJnbeqMkPNCz2zWz
         YTTPDUpksfUQ7eM59+YMfPnvbnF5ZykVFJaOdsGeqKDRm4MdwZj34F/bWws7cPonUK
         RiNXcV7A1b/F50v7paVkqxdemr7jJ5flZyZvdhi5UvKaVUa4NOMFCnJVr8aYM8tm5P
         OB7NXgaaCVMUfnq6Ioh4idKH3g3aMt3qVSgivvC4KysD8NZuv5EmMyQD24FHyUgrp9
         ypDT76Yah1oOA==
References: <CABEcMwVKFmie9Dx1PMRgY+yDWFN6TtTX0727aiWQvn971CbJwA@mail.gmail.com>
User-agent: mu4e 1.6.6; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Shantur Rathore <i@shantur.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: dwc3 over pcie or with more than 1 udc
Date:   Mon, 20 Sep 2021 14:45:53 +0300
In-reply-to: <CABEcMwVKFmie9Dx1PMRgY+yDWFN6TtTX0727aiWQvn971CbJwA@mail.gmail.com>
Message-ID: <871r5jsc2n.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Shantur Rathore <i@shantur.com> writes:
> I am trying to find a dwc3 compatible PCIe USB controller or a dwc3
> compatible device with more than one udc.
>
> Is there any such device supported in kernel?
> If yes, please let me know which one.

you can have as many dwc3 instances as you want. AM437x has two dwc3
instances, so do several other TI and Qcom devices, albeit not on
PCIe. Some recent Intel platforms have more than dwc3 in the die over
(fake?) PCIe.

In any case, there are no limitations (apart from memory and available
PCIe ports) to having more than one dwc3 over PCIe. If you can find a
discrete device like that, it's difficult to say.

-- 
balbi
