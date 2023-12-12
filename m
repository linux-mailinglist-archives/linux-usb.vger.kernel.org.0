Return-Path: <linux-usb+bounces-4013-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06DA80E617
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 09:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6466C281E11
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 08:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36D318C3F;
	Tue, 12 Dec 2023 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ga8GfI4R"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B5A17989
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 08:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85825C433C9;
	Tue, 12 Dec 2023 08:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702369548;
	bh=3a9AxDt7rKdnQt1lB7x7eM9PZxjgwdVCfCxEm49JQi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ga8GfI4RYaUAlSj8fu+eIRYZS/vv75ipHwGI5bbnI4pXxIrSlsTzwVHl4zqa5cF0u
	 NtqxzH+P39uUeVJ9XrXiWb+8Vnh5+BmDbhh80sKcdyyjccCE5gBl0lxyuJCI5xo5zh
	 d2eombqosAAEVyS7L4d1kPhT8jKw68sc3vo3Pj7E=
Date: Tue, 12 Dec 2023 09:25:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: justin.chen@broadcom.com, alcooperx@gmail.com,
	chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] usb: fix comment typos
Message-ID: <2023121236-earful-email-ea09@gregkh>
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
> Signed-off-by: shitao <shitao@kylinos.cn>
> ---
>  drivers/usb/gadget/udc/bdc/bdc_core.c | 2 +-
>  drivers/usb/mtu3/mtu3_qmu.c           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Also why isn't this two different patches?

thanks,

greg k-h

