Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44D433A2CF
	for <lists+linux-usb@lfdr.de>; Sun, 14 Mar 2021 06:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhCNFXB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 Mar 2021 00:23:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:55198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233268AbhCNFWo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 14 Mar 2021 00:22:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B07C664E99;
        Sun, 14 Mar 2021 05:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615699363;
        bh=5kfXABJ0cPh+YX7q9yHUL8SvtR0sbXwbrCcNN/EzoaY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P7B2eJ2zl+dsJw31TAzSB1O+Yl3AG+B4HN5xJy+5tnSOsnY76FZosvreV+x6lT1vR
         zkD1R/pzUi264c6fAPTGjNkQrIVPnnG3uaYNzotyzNuZymxYjAdE4k4NaUakLpnMy+
         c09BtuQ6QnhCdOeazstPDeDgvmXm2PTJ6Gxc1HkKQ5I7yd0Tp9tSf/la79xpklWCVW
         1mZsKZhsDE1qaJqNUf+HzY9Tnpflnzd1K+P4bPz+NTSO1S2Q6vM4OCsiHL4PxGNycY
         uNKPwxi6oT5/Rxg6689F/9vS/tvMlEi1/eEb2BvQb6Fe9n0mQYSBsbCJXFbiKxHKiz
         HouSClevGkC/g==
Date:   Sun, 14 Mar 2021 13:22:37 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     "jinguang.yu" <949347424@qq.com>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: xhci-hcd xhci-hcd.0.auto: ERROR unknown event type 37
Message-ID: <20210314052237.GB30122@b29397-desktop>
References: <tencent_BC210BFA458561BB06202CD4A82A21677708@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_BC210BFA458561BB06202CD4A82A21677708@qq.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-03-13 16:36:39, jinguang.yu wrote:
> Hi Peter,
> 
> 
> Recently, we met a problem about xhci driver, which show "ERROR unknown event type 37" in xhci_handle_event() when we using a usb camera. Beside I have found your commit&nbsp;dc0ffbea5729a3abafa577ebfce87f18b79e294b in kernel to solve this problem. Could you provide some advise for ours to solve this problem? I uploaded this Error log in attachment. I'm very very grateful for your response.
> 
> 

Cc: USB ML and Mathias,

Hi Jinguang,

Please wrap your line up 75 characters next time.

What's your kernel version, and does my patch work for you? It usually
occurs when the software submits the requests faster than the requests
has handled.

-- 

Thanks,
Peter Chen

