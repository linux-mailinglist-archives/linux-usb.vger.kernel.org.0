Return-Path: <linux-usb+bounces-2114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4307D486D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 09:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF2711C20B54
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 07:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5012E1427A;
	Tue, 24 Oct 2023 07:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHgzh0+a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF514A84
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 07:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42933C433C7;
	Tue, 24 Oct 2023 07:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698132243;
	bh=z+98ZYYA5tYAXrUA29VmteMZJ1HAPVT8QigkmFc0UAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHgzh0+aZBqtNEQGXgQvoZnqi8f2xzj0q58L0tywtJF5wveM9y4mph3y8c3kI7Xal
	 9R86deghjK+J5NrK0ExKGGI9dXDScOEpFuyWey5ObyFDVUEyxaTg6gy6bR02z+MbF0
	 jBReElzu3uzsCaGT0JKB8Dcway7xnuvbszKCsZ+PeN7Gnd+ApFDX+fTXlu4h18CGId
	 Mk6H+TTfCNeKGKpTRe+hK7W1JPRmSze7ggKl2SRQWlwMJ67/5MMk1KNqtT4Jb6GB5e
	 SW+aVDPEHQ7y4s484NpHn90rqAowBiu6vXiJ/hrcnDvHYq3GvP3FPfHc65m8PwqeYx
	 cwUORK9JOk4Fg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvBm0-0003ib-06;
	Tue, 24 Oct 2023 09:24:20 +0200
Date: Tue, 24 Oct 2023 09:24:20 +0200
From: Johan Hovold <johan@kernel.org>
To: "Puliang Lu(Puliang)" <puliang.lu@fibocom.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] USB: serial: option: add Fibocom to DELL custom modem
 FM101R-GL
Message-ID: <ZTdxJKFSfeSHoHXN@hovoldconsulting.com>
References: <TYZPR02MB508845BAD7936A62A105CE5D89DFA@TYZPR02MB5088.apcprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR02MB508845BAD7936A62A105CE5D89DFA@TYZPR02MB5088.apcprd02.prod.outlook.com>

On Tue, Oct 24, 2023 at 06:36:58AM +0000, Puliang Lu(Puliang) wrote:
> On Mon, 16 Oct 2023 10:40:05 +0200, Johan Hovold wrote:

> > I've now applied the patch.
> 
> Can I still modify my patch now? 0x8213 is an ESIM device, 0x8215 is a NO ESIM 
> device, but it is written backwards in the commit message, and the define is 
> also reversed.

No, this patch is already in Linus's tree so that's not possible. But
please do send a follow-up incremental fix.

Johan

