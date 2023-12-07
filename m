Return-Path: <linux-usb+bounces-3801-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A46268081A7
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 08:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FBCE281855
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 07:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FE8154A0;
	Thu,  7 Dec 2023 07:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HIE61cPk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579E015E98
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 07:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2952EC433C7;
	Thu,  7 Dec 2023 07:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701933062;
	bh=71XowMO1zokcNUVSjk7xgSIelzcj/5YLVU2L9lqlOek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIE61cPk1suFhoEEtmSEKqDL3oRt5v1fozcF1+3dkUah52fb1aTBg3lMYugNifZu6
	 DSE+OKcVM3mvSSVLZlNV1kg/1SXiemnrQQXMBE/Bm9xQ8CRTJG4I2mR57zgk4rrIuq
	 mItlLbjuyor+w/iZ8mX/+DVlYGma7Nmi1cg8p178=
Date: Thu, 7 Dec 2023 08:10:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
	Roy Luo <royluo@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] usb: core: add phy notify connect and disconnect
Message-ID: <2023120724-herring-filled-c32e@gregkh>
References: <20231110054738.23515-1-stanley_chang@realtek.com>
 <20231110054738.23515-4-stanley_chang@realtek.com>
 <4736a6933f3546c48f24a635c15a5e20@realtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4736a6933f3546c48f24a635c15a5e20@realtek.com>

On Thu, Dec 07, 2023 at 04:50:10AM +0000, Stanley Chang[昌育德] wrote:
> Hi Greg,
> 
> Please help review this patch.

This series is gone from my tree as others reviewed it and asked for
changes.  If you think those changes are not needed, feel free to resend
it with an explanation of why that is so.

thanks,

greg k-h

