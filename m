Return-Path: <linux-usb+bounces-1341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B5E7BF39D
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 09:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F738281D8D
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 07:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70933C129;
	Tue, 10 Oct 2023 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ocfjkqSw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAECC63DF;
	Tue, 10 Oct 2023 07:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC21C433C7;
	Tue, 10 Oct 2023 07:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696921379;
	bh=75DdSpD2VdSaKLW4DBCxIc0yNGSCKNe0WtGpPASdFUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ocfjkqSw5UhrFExVbB/qCdabDvK3hXfbI9ZvtF8ZmrDCGX7pORVvDqUpQ/VturcjG
	 iTCQwgdY8MNG64+aKGBL5Dnr9AGoDjCGRg3kuk0LAFx4+SxfAwB3Y4ZHn7tEzC7Kfk
	 IPfNhujurIY8oMO6WEkRnCKU3kSVyj/EkCLq6Q00=
Date: Tue, 10 Oct 2023 09:02:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abdel Alkuor <alkuor@gmail.com>
Cc: heikki.krogerus@linux.intel.com, krzysztof.kozlowski+dt@linaro.org,
	bryan.odonoghue@linaro.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, ryan.eleceng@gmail.com,
	robh+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	Abdel Alkuor <abdelalkuor@geotab.com>
Subject: Re: [PATCH v10 00/14] Add TPS25750 USB type-C PD controller support
Message-ID: <2023101017-custard-scale-470f@gregkh>
References: <20231003155842.57313-1-alkuor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003155842.57313-1-alkuor@gmail.com>

On Tue, Oct 03, 2023 at 11:58:33AM -0400, Abdel Alkuor wrote:
> From: Abdel Alkuor <abdelalkuor@geotab.com>

Note, your subject line says 00/14 yet your patches had 00/09.  I hope
you didn't dropp patches somewhere?

I applied what is here now, but are some missing?

thanks,

greg k-h

