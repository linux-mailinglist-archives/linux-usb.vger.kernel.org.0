Return-Path: <linux-usb+bounces-20100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FDAA27246
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 13:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E4BB1882558
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 12:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692EA20E32F;
	Tue,  4 Feb 2025 12:46:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DA61BC3C;
	Tue,  4 Feb 2025 12:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673196; cv=none; b=leQrBk82ijhB34hpRuSkQzwhvVkblLaQOtsk81VdKX9Vco/134WiFEQM+6fwnn+XFGHTNAvhsyYM992nWVb8EzT1hsnJgZVx5olQOIwna1rBCljkfAEWvBQBQDxnBAHRz5T0aLlEuipmlb160kAp1sRul/Yd+QEsQhEjp/5HH6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673196; c=relaxed/simple;
	bh=/3Uzy1AzirjLbtYgEkg1X4r7wCucyyirKFO9AWSLxJE=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNJebiIwHe3tXBOBU68SUE8MoEbcU2NT9v3LnHSgprvIyyaA5wp4OMo1kjbjfCdzQ1g0pkQ6yX7Est/wVX3VkKaTWrFbdHogAyoCcdC+dr813Sol8520tfCXGScBkKmTvdDoPtPmc5KKQ31H7SwKpfeL3up8+Ml74UlTU4QxjgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YnNNJ4148z6D9d1;
	Tue,  4 Feb 2025 20:44:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BE316140B3C;
	Tue,  4 Feb 2025 20:46:30 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 4 Feb
 2025 13:46:30 +0100
Date: Tue, 4 Feb 2025 12:46:28 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, Alexander
 Lobakin <aleksander.lobakin@intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>, "Mark
 Brown" <broonie@kernel.org>, =?ISO-8859-1?Q?Ma=EDra?= Canal
	<mairacanal@riseup.net>, Robin Murphy <robin.murphy@arm.com>, Simona Vetter
	<simona.vetter@ffwll.ch>, Zijun Hu <quic_zijuhu@quicinc.com>,
	<linux-usb@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a
 simple device/bus is needed
Message-ID: <20250204124628.000027a5@huawei.com>
In-Reply-To: <2025020424-retrain-recharger-407c@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
	<2025020424-retrain-recharger-407c@gregkh>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue,  4 Feb 2025 12:09:13 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
FWIW LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>




