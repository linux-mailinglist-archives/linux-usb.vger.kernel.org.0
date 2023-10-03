Return-Path: <linux-usb+bounces-996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6647B6215
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 2F07FB209F1
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 07:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79C6D26F;
	Tue,  3 Oct 2023 07:05:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746891C36;
	Tue,  3 Oct 2023 07:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6FCC433C7;
	Tue,  3 Oct 2023 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696316736;
	bh=SjGX3jCFVdiNsB2r2BY7I5WgDYwtsa92FOhazxUr+iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5RDnAoElwAkbKO9DyhYFDDRq/2FQ/6FvrGCb3609E2bA5ZZImlL7nuowYdxArol4
	 KiBG+BjZfxOa3JiS0vsz2+2B6w41FJMNsuLddxIFrZdRPdaFrlgMiXeZ1A8pvVSzYQ
	 PRSHteEYXDYP46qFLi7KbYhzvJYtX11EKOdevqHc=
Date: Tue, 3 Oct 2023 09:05:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: peter.chen@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, xu.yang_2@nxp.com,
	peng.fan@nxp.com, avifishman70@gmail.com, tali.perry1@gmail.com,
	joel@jms.id.au, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, j.neuschaefer@gmx.net,
	openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v3 0/3] usb: ChipIdea: add Nuvoton NPCM UDC support
Message-ID: <2023100342-unnerving-diaphragm-cf36@gregkh>
References: <20231002161350.64229-1-tmaimon77@gmail.com>
 <2023100323-reunite-upfront-8922@gregkh>
 <CAP6Zq1jHzRP1Ytzk8YXyR8ppAP=ZoPvPkYvC2yMRfTt5140zqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1jHzRP1Ytzk8YXyR8ppAP=ZoPvPkYvC2yMRfTt5140zqw@mail.gmail.com>

On Tue, Oct 03, 2023 at 09:56:47AM +0300, Tomer Maimon wrote:
> Hi Greg,
> 
> Forgot to add in Acked-by: Peter Chen <peter.chen@kernel.org> in V3,
> Resend the patch set with the Ack.
> 
> Should I do it differently?

You need to tell me what the difference is, otherwise I would have no
clue what to do, what would you do if you had to review all of these and
try to figure out which ones to accept?

Please send this as a v4.

thanks,

greg k-h

