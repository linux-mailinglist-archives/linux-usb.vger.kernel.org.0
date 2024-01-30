Return-Path: <linux-usb+bounces-5640-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF3E842711
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 15:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D119328EC1E
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 14:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2EA7A73C;
	Tue, 30 Jan 2024 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWSvS3Mg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC00B5427E
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706625707; cv=none; b=T3OJa+k6ommEDK7tnAZLzqORRSV711ybCW1kICH7YKkbuNWS7uCigYzh7l5+0bg6fywe2Rhyg9WX9KJ/lqwrrdNL92PK+GUeXrl+BPwK6PRObp7JJYek5OmwijKIY1fyrxn5iFFkeQ+KQCRSzLtaOPrn+KsBG+cmKT2DvxwbNNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706625707; c=relaxed/simple;
	bh=DVSAleZc/HcCDe2R+Uu+pUud4biMeG2l9P9OKTplA8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0JRPYnuq5pg6fwQ6uOCux1ZCHtrRYRIFQXNcWFuBbowcCuOvxvW1hrMKUlVMrnyEeU4QJV3lgp9UeFqd2p3PE07Vz2p1/BXFLnDVrEjwMIrWWbTxUR2dpbS2I6getGZ3bdRu+GVlRwIhiL+iRmmAjAFzJynLNesFFDAeMcOBzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWSvS3Mg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55640C433F1;
	Tue, 30 Jan 2024 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706625707;
	bh=DVSAleZc/HcCDe2R+Uu+pUud4biMeG2l9P9OKTplA8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWSvS3Mg8+c5hwfOMRn1GIp2f+6s2Bv4Q73vOBLGrbR4gQVRO1PVEdpOF9C8uighl
	 cZFWdAeJAn6zuc3Zk9JkBFPwAnCc/RIfimC4k5BZGf600jXFPsYmf3V87zbgfjpAR3
	 uqb9f25ppctoWWAoxLsgd+LL6aFKHpxWuTNZJE0j6QPg5EWgC/EYaKkZkcvaRBBDlV
	 +WEu3L6QesgXEvAP3tVHsNNYZo5XwAWcgytvZc1XQh5t/NH3fby8c8RnGb5Ey9+2AI
	 VjKvAuIfbMQiCTAVCfKC3Ef7DJjugWxgYRTcIJjkJgu77V7tLqR/iuCaRNSg8hu6GJ
	 +YLLe6u0Jp72g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rUpJ1-000000002Ud-2Hxa;
	Tue, 30 Jan 2024 15:41:44 +0100
Date: Tue, 30 Jan 2024 15:41:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Leonard Dallmayr <leonard.dallmayr@mailbox.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: cp210x: add ID for IMST iM871A-USB
Message-ID: <ZbkKp-7xL5Zl6G9w@hovoldconsulting.com>
References: <ZZfrkSbmCW7vNCEZ@hovoldconsulting.com>
 <20240105123549.87143-3-leonard.dallmayr@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105123549.87143-3-leonard.dallmayr@mailbox.org>

On Fri, Jan 05, 2024 at 01:35:51PM +0100, Leonard Dallmayr wrote:
> The device IMST USB-Stick for Smart Meter is a rebranded IMST iM871A-USB
> Wireless M-Bus USB-adapter. It is used to read wireless water, gas and
> electricity meters.
> 
> Signed-off-by: Leonard Dallmayr <leonard.dallmayr@mailbox.org>

Now applied, thanks.

Johan

