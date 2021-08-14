Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58EAA3EC0EF
	for <lists+linux-usb@lfdr.de>; Sat, 14 Aug 2021 08:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235990AbhHNGjy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Aug 2021 02:39:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:54588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235940AbhHNGjw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 14 Aug 2021 02:39:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 833A561038;
        Sat, 14 Aug 2021 06:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628923164;
        bh=v5URtSlg1GUgqqUtxkTj2PGtE073CYrcjIYPEnEuHxM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O01FDvWsS4zqB4xEI7W0ni/KSF59m9bLb5LfDWa3D3nchrzRCC/Dfa4JeWFSzuUBl
         G9MKvCWXNLYpsUVsK5sz2nHWjXXbowMIJSO0hO3q7z4pLGEGvPtwgZE7YuZCKc0Kqk
         OqmIH3cBPk1fSFQOwKNWP/SfrPD9mmnYmDh2I8PE=
Date:   Sat, 14 Aug 2021 08:39:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v3 0/2] Stop calling request_irq(), etc. with invalid
 IRQs in the USB drivers`
Message-ID: <YRdlGFh71JmKrJIm@kroah.com>
References: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 13, 2021 at 11:23:43PM +0300, Sergey Shtylyov wrote:
> Here are 2 patches against the 'usb-linus' branch of GregKH's 'usb.git' repo.

Wait, why that branch?  Please make them against the branch you want
them applied to.  Hopefully they will apply to the usb-next branch...

