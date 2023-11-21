Return-Path: <linux-usb+bounces-3108-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E317F3194
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 15:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D82F1C21CAA
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 14:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F5C495DC;
	Tue, 21 Nov 2023 14:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MYHPBhcH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F072315C1
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 14:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A6BC433C7;
	Tue, 21 Nov 2023 14:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700578197;
	bh=Shfyuu0LFsaf0x/cFRvoygir7hUWkkISScjKC4pM99A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYHPBhcHtJuX25LjmDot7pPB+yBE2zIPDpiRlDCMhEyllkk8ozP5QcOG1AQlpPI2t
	 9NS3Q8m7Go7FgJkh8Fc4wkzatxFVLaGV2Tdg8R6DGhwinsqEqb7UNC0x3LEWSa6mE1
	 +4GQyEO2UbAzb+HrFZuIM/CEeDRbUCQkqlF9fSlI=
Date: Tue, 21 Nov 2023 14:58:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Akash Kumar <quic_akakum@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Jing Leng <jleng@ambarella.com>, Felipe Balbi <balbi@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Pratham =?iso-8859-1?Q?Pratap=A0?= <quic_ppratap@quicinc.com>,
	Jack Pham <quic_jackp@quicinc.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Add framebased frame format support
Message-ID: <2023112123-setting-waking-7896@gregkh>
References: <20231114112516.2723-1-quic_akakum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114112516.2723-1-quic_akakum@quicinc.com>

On Tue, Nov 14, 2023 at 04:55:16PM +0530, Akash Kumar wrote:
> Add support for framebased frame format which can be used to support
> multiple formats like H264 or H265 other than mjpeg and YUV frames.
> 
> Framebased format is set to H264 by default, which can be updated to
> other formats by updating the GUID through guid configfs attribute.
> 
> Also,add UVC 1.5 extension to support H264 format and different camera
> controls, adding support for Exposure, Zoom, Pan, tilt.

When you say "also" or list different things that are done in a single
change, that's a huge hint to divide this up into smaller patches and
make it a patch series.

Please do that here.

thanks,

greg k-h

