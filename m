Return-Path: <linux-usb+bounces-2260-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F47D959C
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71B13B213C7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 10:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A2414A8E;
	Fri, 27 Oct 2023 10:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r0hYNtk9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFA611C81
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 10:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370BFC433C7;
	Fri, 27 Oct 2023 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698403912;
	bh=C/0yFaoQyhngRIiLb9LDaAsApYXqKwf9DVx6WgurwqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0hYNtk9eMaMzOXQW1kBTl4GY0D0Yd4nnHCUvH07QbBpJ4wi+0HO99WynJZQCjQic
	 H5HJw4BKOZ8IXGnY6C6Jv73FcrTIC8iOA/7CtUvDB9dAx0af2wek8EK5ySp83VVyuW
	 glH0Dt4QJDyJX43q5Ae3LYm/EughG5jQ0VRovb6M=
Date: Fri, 27 Oct 2023 12:51:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Avichal Rakesh <arakesh@google.com>
Cc: etalvala@google.com, jchowdhary@google.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	m.grzeschik@pengutronix.de, dan.scally@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v8 1/4] usb: gadget: uvc: prevent use of disabled endpoint
Message-ID: <2023102728-pluck-perish-e0a7@gregkh>
References: <20231019185319.2714000-1-arakesh@google.com>
 <20231024183605.908253-1-arakesh@google.com>
 <eeea887c-8fd5-45df-aed8-1046d8451a2e@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeea887c-8fd5-45df-aed8-1046d8451a2e@google.com>

On Thu, Oct 26, 2023 at 01:23:44PM -0700, Avichal Rakesh wrote:
> Considering Laurent and Dan haven't responded, and Michael and I have 
> tested this change, would it be possible to merge this patch set
> if the changes look OK to you? I don't think there are any outstanding
> items to be done around these fixes.

I would like their review first please.

thanks,

greg k-h

