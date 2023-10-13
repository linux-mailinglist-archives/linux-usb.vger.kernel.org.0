Return-Path: <linux-usb+bounces-1561-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 095227C8202
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 11:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CD33B20A83
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 09:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6E510A38;
	Fri, 13 Oct 2023 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEaijQVQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5261101DD
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 09:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFDAC433C8;
	Fri, 13 Oct 2023 09:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697189202;
	bh=8iLd7VlcI7wXbTB+5Lhowsuei0/aADcJ/3z8eZEJZtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEaijQVQVjX5LLJb1E5qsND213nlr/XpCeTNsFYwpaR1S9Dq6dnzPSYhyVBPgyOIL
	 r96Q/SO2M/YyGq/ZoFg+XFhI812JHa2+vdfQiyoPQxVjG35JzCJzpxhmPdihv4v5qp
	 6Ge0mO1WuJCVrDTrh1DiRhNIAQrUM5vCwojWRTKZ4sW8dI/0wwkTD99VTQUZ2SOfYJ
	 G33OFXQEQ+dK9hkU7Gz8MW4CaLyehSXcuhx328+g1ss4qmXct/hDHNHY38NX+tM+mw
	 K7NdoljOk3SQ38lDdc1O/TS95QcEdsDfU/Co85D8iTIXNCwKkOad1F4dnhvKtICvfj
	 oID0x3BVctMgw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qrERu-0004N0-02;
	Fri, 13 Oct 2023 11:27:14 +0200
Date: Fri, 13 Oct 2023 11:27:14 +0200
From: Johan Hovold <johan@kernel.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Telit LE910C4-WWX 0x1035
 composition
Message-ID: <ZSkNctWGrKZ6Jb54@hovoldconsulting.com>
References: <20230905073724.52272-1-fabio.porcedda@gmail.com>
 <CAGRyCJEzKn13gbBYfoF9H5XKJ_OSXJh0+h3U6SMa6c5S6kAVtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRyCJEzKn13gbBYfoF9H5XKJ_OSXJh0+h3U6SMa6c5S6kAVtQ@mail.gmail.com>

On Wed, Sep 06, 2023 at 11:02:22AM +0200, Daniele Palmas wrote:
> Il giorno mar 5 set 2023 alle ore 09:37 Fabio Porcedda
> <fabio.porcedda@gmail.com> ha scritto:
> >
> > Add support for the following Telit LE910C4-WWX composition:
> >
> > 0x1035: TTY, TTY, ECM
> >
> > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> > Cc: stable@vger.kernel.org
> 
> Reviewed-by: Daniele Palmas <dnlplm@gmail.com>

Thanks for the patch and for the review.

I included the usb-devices output directly in the commit message when
applying.

Johan

