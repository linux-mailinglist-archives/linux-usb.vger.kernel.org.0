Return-Path: <linux-usb+bounces-4012-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E8780E616
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 09:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A2D41F2187A
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 08:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149FE18C3F;
	Tue, 12 Dec 2023 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y0tTobda"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F227182A8
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 08:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D72DC433C7;
	Tue, 12 Dec 2023 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702369533;
	bh=UyrCZ5NeqkIbDqZ4IfzKB2v4FwYYwyufuxet/S+xQZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y0tTobdaLmy4VCh/NwI9a3Snubd38cOqAeFoPopo7s4MuUU8zj92krFHmnPOxV22x
	 gpap/U1YH6sUfKArJWBVkst/TOgQIYPkRkI1wKdzDCUWhPBIZN+Lj+WfWr85YYx5z9
	 urcYYae/Sc5eiRb35t0jXR6xHCqsAW/yosWauCtE=
Date: Tue, 12 Dec 2023 09:25:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: justin.chen@broadcom.com, alcooperx@gmail.com,
	chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] usb: fix comment typos
Message-ID: <2023121249-swan-steep-dc94@gregkh>
References: <20231212074557.3100489-1-shitao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212074557.3100489-1-shitao@kylinos.cn>

On Tue, Dec 12, 2023 at 03:45:57PM +0800, shitao wrote:
> Fix two comment typos in usb module files.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>

What is this?  It needs to be documented better, sorry.

thanks,

greg k-h

