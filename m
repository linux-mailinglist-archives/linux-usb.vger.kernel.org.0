Return-Path: <linux-usb+bounces-2890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D117EBD52
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 08:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CB82813D5
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 07:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786413D9F;
	Wed, 15 Nov 2023 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lu/wTfXo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC43D6C
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 07:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497DAC433C7;
	Wed, 15 Nov 2023 07:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700031938;
	bh=bURo+kPcLtHMtWGwi2g41oHG5erQjXrGpn60QsxquK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lu/wTfXo2S6xnDcDe00IORySZopCBXK0nhdOYNnmZaCkmf3zjgHjggFbEAVvWbZEI
	 jIaHiCaOwo1OYxqFg1V0+Nk8WwaROnzQocqISoDyp8dtl8K8Km8mMenajsCv1QrIbK
	 u8NlDeJQUy/oBqIDl67Ud2jVGrgMBTbISQvKJhIlYWLPmHYgstvmCR3wV21HtZ2Lzv
	 06FWtZ5obIpT7GT9nGCpQOl1utVX1ut8OyW1sTEl5GQl7FcD5oSfShkqPDka5JpHrx
	 lgi43UESTj0xh4C9Qniwo8cM6vOw6g46hW2iLEc54pGmVjhyb/fxd3dMXvzwsdesss
	 0QkEeQjs6hvIw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r39xv-0000qJ-0N;
	Wed, 15 Nov 2023 08:05:35 +0100
Date: Wed, 15 Nov 2023 08:05:35 +0100
From: Johan Hovold <johan@kernel.org>
To: "Puliang Lu(Puliang)" <puliang.lu@fibocom.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] USB: serial: option: modify Fibocom to DELL custom modem
 FM101R-GL
Message-ID: <ZVRtvw7rSzJuuyIj@hovoldconsulting.com>
References: <TYZPR02MB5088D4550E1F4D9E4D66344B89B1A@TYZPR02MB5088.apcprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR02MB5088D4550E1F4D9E4D66344B89B1A@TYZPR02MB5088.apcprd02.prod.outlook.com>

On Wed, Nov 15, 2023 at 04:11:02AM +0000, Puliang Lu(Puliang) wrote:
> 
> > > Modify the definition of Fibocom USB serial option driver FM101R-GL different variants
> > > 
> > > - VID:PID 413C:8213, FM101R-GL ESIM are laptop M.2 cards (with
> > >   MBIM interfaces for Linux)
> > > 
> > > - VID:PID 413C:8215, FM101R-GL are laptop M.2 cards (with
> > >   MBIM interface for Linux)
> > > 
> > > 0x8213: mbim, tty
> > > 0x8215: mbim, tty
> > > 
> > > Signed-off-by: Puliang Lu <puliang.lu@fibocom.com>
> > > ---

> May I ask when this patch can be merged?

It's still in my queue and I haven't really looked at it yet. But don't
worry, it's not lost.

Johan

