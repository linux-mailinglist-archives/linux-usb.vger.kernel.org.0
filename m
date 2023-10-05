Return-Path: <linux-usb+bounces-1108-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9627B9B21
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 08:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 6294B281BA1
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 06:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D684C9D;
	Thu,  5 Oct 2023 06:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4ZW/3jf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C17F
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 06:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6666C433B6;
	Thu,  5 Oct 2023 06:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696487745;
	bh=ypr08pgY6c2eP9P2qYB2bJHbuVcnNmfSe66z44UoZvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4ZW/3jfyG3xsagsVjX0ZESZ8I/QmLSI7NBZzFnORa9ftepVJZj4aSEHYvCKmaOSY
	 TTNAM63zrluIweCFtqRQEXhKqjsQqPgBURoxJiU/Sk7GJEI0aYcur7/oZCI30qygKQ
	 gHv3CckD5W2IYtQFH26Hrgn0kBLLENjaOvu+WEzzj5Ruvb0EcKr0830ZRPUnzg/yiW
	 BPZ38UhButfb4UYY+mWJvDgn4tN7jvaFHgBQUAizjpAHw0KGIMRjn2Gn1Vei6c7QxD
	 kyXVztyfFfGHZ/fZXOYfdvYhPOOkCIuqDp6p/O+3zWJIX5TKmmx0ndjEx1KaCkhgNi
	 XxDnBa5Cfzfzw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qoHxp-0004D5-0s;
	Thu, 05 Oct 2023 08:36:01 +0200
Date: Thu, 5 Oct 2023 08:36:01 +0200
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com,
	quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH v12 0/3] Add multiport support for DWC3 controllers
Message-ID: <ZR5ZUaWcyRj5sZKx@hovoldconsulting.com>
References: <20231004165922.25642-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004165922.25642-1-quic_kriskura@quicinc.com>

On Wed, Oct 04, 2023 at 10:29:19PM +0530, Krishna Kurapati wrote:
> This series is a set of picked up acks and split from larger series [1]
> The series is rebased on top of:
> Repo: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> Branch: usb-testing
> commit 03cf2af41b37 ("Revert "phy: qcom-qmp-usb: Add Qualcomm SDX75 USB3 PHY support"")
> 
> The patches present in series have been reviewed and acked by respective
> maintainers. They dont break any existing implementation and is just a
> subset of merge ready multiport code. The rest of the patches will be
> rebased on top of the usb branch once this series is merged.
>
> [1]: https://patchwork.kernel.org/project/linux-usb/cover/20230828133033.11988-1-quic_kriskura@quicinc.com/
> 
> Krishna Kurapati (3):
>   usb: dwc3: core: Access XHCI address space temporarily to read port
>     info
>   usb: dwc3: core: Skip setting event buffers for host only controllers
>   usb: dwc3: qcom: Add helper function to request threaded IRQ

NAK.

These patches make very little sense on their own and can't really be
evaluated without the context of the larger series.

Just work on getting the multiport series in shape and include any acks
you've received so far when submitting new revisions.

Johan

