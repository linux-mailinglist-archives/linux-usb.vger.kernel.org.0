Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73371741604
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jun 2023 18:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbjF1QFE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Jun 2023 12:05:04 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:42538 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbjF1QE5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Jun 2023 12:04:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CCC16135B
        for <linux-usb@vger.kernel.org>; Wed, 28 Jun 2023 16:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4C8C433C8;
        Wed, 28 Jun 2023 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687968296;
        bh=371onyC+89R4E/cACuWXhtDn/JSRL4fki0fOv/vCX+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m27IYMF2/nje7TEimgknKPlCGSlM5hgyD+2D2THhMNgCAPDAU5CgiAtBPcNXumHNq
         eHsgBQTqyTg9qV6/jSR2G/Ypwg8woS4XtZLPoEF+nPQl3bEQbwjzty+Pxac/+C2uLE
         Xgr0PJ8mKG8QABMqCsJWnAwiw7gsRfPQHWw4lf6I=
Date:   Wed, 28 Jun 2023 18:04:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     jerry-meng <jerry-meng@foxmail.com>
Cc:     johan <johan@kernel.org>, linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH]     USB: serial: option: support Quectel EM060K_128
Message-ID: <2023062812-junction-item-cfd3@gregkh>
References: <tencent_05185A450C60A1EE8A651E34CC0F60304506@qq.com>
 <2023062821-scarcity-calculate-6f35@gregkh>
 <tencent_CABB744D2C39A0997F9683F3C2142A520109@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_CABB744D2C39A0997F9683F3C2142A520109@qq.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Wed, Jun 28, 2023 at 08:14:41PM +0800, jerry-meng wrote:
> Hi Greg:
> 
> Sorry, added the indentation by mistake.&nbsp;
> Do I need to send&nbsp; patch v2 ？

Please do, otherwise as-is, we couldn't take this, right?

Also please fix your email client to not send html email, it's rejected
by the mailing lists.

thanks,

greg k-h
