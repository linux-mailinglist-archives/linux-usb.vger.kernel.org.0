Return-Path: <linux-usb+bounces-625-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 171387AFE00
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 10:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 44B8B1C20852
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 08:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D804714F67;
	Wed, 27 Sep 2023 08:16:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A949290B
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 08:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20CBAC433C7;
	Wed, 27 Sep 2023 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695802595;
	bh=uEUSTFph3mLlkwgv5DTW0f7XPtXB/8XECV8Mj5d6RsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qc+7HZR2ZLzxGFOzsHW5R4Ho/73z4LdNVH8v/WUgIKRedlohyoknuoL51Zt4pb81U
	 HcljwTT/8vHaecRxbSyTnMICqPl0mY0FIFzCpAGTtCEX/zmH7O/4k1YbPI8abaxlI/
	 /Otr1Mv8WCGPiaTKZGqbR2EOTfJi+Yrpu1P0w4dg=
Date: Wed, 27 Sep 2023 10:16:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Ivan Orlov <ivan.orlov0322@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com,
	quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH v5] usb: gadget: udc: Handle gadget_connect failure
 during bind operation
Message-ID: <2023092701-facelift-projector-d1d4@gregkh>
References: <20230927073027.27952-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927073027.27952-1-quic_kriskura@quicinc.com>

On Wed, Sep 27, 2023 at 01:00:27PM +0530, Krishna Kurapati wrote:
> In the event gadget_connect call (which invokes pullup) fails,
> propagate the error to udc bind operation which in turn sends the
> error to configfs. The userspace can then retry enumeration if
> it chooses to.

Will this break userspace that is not expecting error codes to be
returned?  What userspace code will now be modified to handle this?
Where is that work happening?

thanks,

greg k-h

