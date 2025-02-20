Return-Path: <linux-usb+bounces-20880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23291A3DEB1
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 16:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D66B17631C
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 15:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3241D5AA0;
	Thu, 20 Feb 2025 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cbpl9cPW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD31CB51B
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065493; cv=none; b=tA5RpTl1gM+qcP70EEPxg2xkAE3F3VcgITX58c2jolIxyDSDpOj/+a5XkjGQTTOg+JEe/lqi2BNuGRFtiJXBLUW0Rq4mFvEJmP34ec4GDADOUU1wcPsl/gpqllsnOyT0+G+KA15oitEWmSAwX7DZomr+o2HtqeCjpQA4QfSESok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065493; c=relaxed/simple;
	bh=4FtNUp72hDGbd0MTPmlX4HPKfvCloUj3xvGiU1Ry++Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVojOM/ani2Sy+EG0Sx+PXL7XnCpoWVWBsSlYD4EvnJzp2fa3TpevJT5XNQjPMM4b/FhG9awk+lUBnxJC+T5+CyIvN17srle5K5gizBektbzAnt9igRSx3I6HQF5s2w+GtDaE7+T3+jHZ3TOgqTfUlqxEOVjV+EHHZp6B+ZIq4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cbpl9cPW; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c0a5aa0f84so98168085a.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 07:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1740065490; x=1740670290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wdFKF6max9zHJTA9AXCtjkIclh2SRJU4CccJ2QqPC6s=;
        b=cbpl9cPWZRs7hEWXnobV+3HqBU65toYhNPgnJwN6yk70Fr3X8dJPvqb9FHfWbnNo+F
         NRhZYPHzJG19uy1PtGJG1O8FEIt+njmFUnGH+h87+SpkgGPNYG7F/+ZLJqcXPj0G3R7r
         TO5nEDnUDdkltutxUTpADngIiDa+pTYwU4ivB9XTp8x7CgJltrjEg8xqVb7THMux2lIK
         ThfQ/qQZWAxftwkitVdYfOCXWnSTuFVZ1prESvY8XVwqZORm5AtrrRFznr6r6WrCV5c+
         O+/kn7d3/vL5VJxeGW4HGRqWoZQbN1WkLwPM9zbmFmOvd3elC9Q+e7HuK/9pFv699M13
         QogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740065490; x=1740670290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdFKF6max9zHJTA9AXCtjkIclh2SRJU4CccJ2QqPC6s=;
        b=VaIPe0Hm5fwVDlbaJHEIJb4+KAVhGY2RRThKJB0JWgsqEKEyqi8ULG6dFxxktUYwvn
         koqr2lab3WmmSRsf07iYht/WgMBihd0im/Kh+hmPfj+1VR7SuxYCU7G9QY3yuycQH8xV
         rEaK6TiUR5hL09qKl2ltgdOp0lVUXPdXucDm9bZEfAfRWK2L9nBUia8of27ok1mEBJuh
         z1H1azDbdWPrRmY0wv27YLacuF2UPU+icVJ+wB/bMpJ3Rs0V8+TDpfLA8VDSS9Mjokus
         2/0Bm0Mgyl7Z11gfmZ73UiLgGHlFNB2yEyuGlHso+Y9ITDZ34itdpLYjc+15rT96Huw3
         oLww==
X-Forwarded-Encrypted: i=1; AJvYcCVYci7n6+xoQ7z0NApvuc16wIGh/l0xGRmV9xDG6NMkj+fNQn5EtN/X4mct6qfE7Sen3aMabRS96WM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Veyd9rwB4mIUa7sNFYx5oGXEaS2lzp/xVkyP7z61qZJNKu+o
	U+nNh4p7w9vddyb58iSEaWBw/OMTm29xXd8PTpylQkQwVJH6fKBianisd9/SAg==
X-Gm-Gg: ASbGncttwXCWgFrwRyzeThm6RpUEw0NtQaUshX04/uKmEjPU8NL1bNWSe5L4gbvhreT
	KWHWd0wqW+hOArzAn1EA2yWVA38THPGZHvgtS9JmjOG1M2nzzNF7fzfWzEC2Dg0SGQRhQht/oZF
	hh6rOSLwFiONOPJQn9iIHG94TJMj+JhFs4etI7XfIXt47FGh9CE65dVfBNGwTRBBHIjbvrfseLT
	W9BwK9Qv19RbHmIfs7khaltspfWpisxP1nd2+o2p7Od3euqWuS0OZiiWzG+5Hm1o+Cm0x38ozox
	vpi1u+/JZGBCTYXuQ8Gke6IszbGMu5/41g==
X-Google-Smtp-Source: AGHT+IGrqN0kWqw3rnxINMBjK3Au7Gi+IwEtfaxdO7n/UMwbKgoPLTcSSbZE/2mSTxwVnPaquiOGMw==
X-Received: by 2002:a05:620a:1a9f:b0:7b7:142d:53a8 with SMTP id af79cd13be357-7c0c2269472mr464903085a.19.1740065490614;
        Thu, 20 Feb 2025 07:31:30 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0abf8a181sm350162485a.16.2025.02.20.07.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:31:30 -0800 (PST)
Date: Thu, 20 Feb 2025 10:31:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	Kannappan R <r.kannappan@intel.com>,
	Amardeep Rai <amardeep.rai@intel.com>
Subject: Re: [PATCH] USB: core: Add eUSB2 descriptor and parsing in USB core
Message-ID: <af2561c0-c700-43cd-91e1-6e2af4d788c0@rowland.harvard.edu>
References: <20250220141339.1939448-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220141339.1939448-1-mathias.nyman@linux.intel.com>

On Thu, Feb 20, 2025 at 04:13:39PM +0200, Mathias Nyman wrote:
> From: Kannappan R <r.kannappan@intel.com>
> 
> Add support for the 'eUSB2 Isochronous Endpoint Companion Descriptor'
> introduced in the recent USB 2.0 specification 'USB 2.0 Double Isochronous
> IN Bandwidth' ECN.
> 
> It allows embedded USB2 (eUSB2) devices to report and use higher bandwidths
> for isochronous IN transfers in order to support higher camera resolutions
> on the lid of laptops and tablets with minimal change to the USB2 protocol.
> 
> The motivation for expanding USB 2.0 is further clarified in an additional
> Embedded USB2 version 2.0 (eUSB2v2) supplement to the USB 2.0
> specification. It points out this is optimized for performance, power and
> cost by using the USB 2.0 low-voltage, power efficient PHY and half-duplex
> link for the asymmetric camera bandwidth needs, avoiding the costly and
> complex full-duplex USB 3.x symmetric link and gigabit receivers.
> 
> eUSB2 devices that support the higher isochronous IN bandwidth and the new
> descriptor can be identified by their device descriptor bcdUSB value of
> 0x0220
> 
> Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
> Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
> Signed-off-by: Kannappan R <r.kannappan@intel.com>
> Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>


