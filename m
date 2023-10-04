Return-Path: <linux-usb+bounces-1064-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7E37B789A
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 09:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 5D95B1C208C5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 07:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4579F7489;
	Wed,  4 Oct 2023 07:21:41 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9FC2F3C
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 07:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C08C433C7;
	Wed,  4 Oct 2023 07:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696404100;
	bh=HDkujlQX+Fd+q+bpEeqrxXaxiuZCSkTikHvTxLJ6Xpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQjDTGNQmSQlRdTeUpgIFabxrbg6CHOL/TkSN1ku0VqA/pt9OZr2FQFQtiDJ4oagF
	 mqQFsNKssJAfBvXOAZ2Iq3/9Kd879Tb668qEYmyktiQ1y6hntU35OjDfVbfkMLlJFi
	 Exzzjs6E69qFVl958sLmQ+dKDRocU+WciW+HIQwg=
Date: Wed, 4 Oct 2023 09:21:37 +0200
From: 'Greg KH' <gregkh@linuxfoundation.org>
To: Woo-kwang Lee <wookwang.lee@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, sj1557.seo@samsung.com
Subject: Re: [PATCH] usb: core: add bos NULL pointer checking condition
Message-ID: <2023100411-duckling-tibia-398a@gregkh>
References: <CGME20231004062700epcas1p16fe36bf6b6a6e5d9d4adeaef32937480@epcas1p1.samsung.com>
 <20231004062642.16431-1-wookwang.lee@samsung.com>
 <2023100439-king-salute-5cd5@gregkh>
 <000101d9f691$4513da00$cf3b8e00$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000101d9f691$4513da00$cf3b8e00$@samsung.com>

On Wed, Oct 04, 2023 at 04:06:17PM +0900, Woo-kwang Lee wrote:
> Hello. I think I missed the patch.

I do not understand, does that mean that you have tested the patch (and
which one, please do not top post), and that this is not needed?

confused,
greg k-h

