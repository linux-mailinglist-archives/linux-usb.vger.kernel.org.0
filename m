Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2402FA040
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 13:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391791AbhARMpP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 07:45:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:53668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391807AbhARMpA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 07:45:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EE6F2231F;
        Mon, 18 Jan 2021 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610973854;
        bh=nS0We+T3WYvr9CWq6EKpGxZ0vecQwDx903aSh9MW13U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jzJZ+9uSlVF+VkYygNSE6Dvi+BqBv3WNxNX40PnXNGWeYhrCeDrM5PQuO3ExDYN6+
         KuHrHabhKnaoYuSZFwlEyIDs2nP6+YdrCmRpkYA1Ewf1dQWlCFzQn96EFaHJySJ7N4
         gDYgub5VtJwaFfsEUT/zCMaeQrLuMTIbTmi8DVec=
Date:   Mon, 18 Jan 2021 13:44:12 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Sheng Long Wang <china_shenglong@163.com>,
        Wang Sheng Long <shenglong.wang.ext@siemens.com>
Subject: Re: [PATCH 0/6] USB: serial: cp210x: add software flow-control
 support
Message-ID: <YAWCnI2edCYI3g5a@kroah.com>
References: <20210118111331.5048-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118111331.5048-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 18, 2021 at 12:13:25PM +0100, Johan Hovold wrote:
> This series, based on a patch by Wang Sheng Long, adds support for
> software flow control to the cp210x driver. Included are also some
> related cleanups.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
