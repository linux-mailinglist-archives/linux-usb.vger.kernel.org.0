Return-Path: <linux-usb+bounces-2421-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB797DDC9D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 07:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76958B210FD
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 06:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EEA5259;
	Wed,  1 Nov 2023 06:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W0ASN1CV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0645385;
	Wed,  1 Nov 2023 06:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE4AC433C8;
	Wed,  1 Nov 2023 06:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698820078;
	bh=hWj52DqnsXqb5POx3jc5q4axMzxAP+iO7/r/1npSns0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0ASN1CV/lVQ/UVVq0Ss710e2SSzCVJKTBACASlNto4Jkh+hq+4wB7S84aOJt0oGg
	 xpYFePECBRbZvOL7TQyp3Yir18or3O1xwud621Oz7IecW0RTw3i+5SDOxABuRTGOCt
	 sNNBeql5Q4uPrVqus31/6F20fEjYiDiGXkruqWNs=
Date: Wed, 1 Nov 2023 07:27:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naveen Kumar M <mnkumar@google.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, royluo@google.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: host: xhci-plat: Add quirk-no-64-bit-support
Message-ID: <2023110138-dill-aloof-c1a9@gregkh>
References: <20231031044021.1162403-1-mnkumar@google.com>
 <20231031044021.1162403-2-mnkumar@google.com>
 <CA+Hc5+6Zb65gL1tCOZ6bYQThVn3HFS_gzj+_P+y-TkrHKw6zbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Hc5+6Zb65gL1tCOZ6bYQThVn3HFS_gzj+_P+y-TkrHKw6zbw@mail.gmail.com>

On Wed, Nov 01, 2023 at 10:13:08AM +0530, Naveen Kumar M wrote:
> Adding the reviewers/maintainers I missed in the previous mail to this patch

That's not going to work, please resend a new series, and please, do not
top-post.

thanks,

greg k-h

