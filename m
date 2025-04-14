Return-Path: <linux-usb+bounces-23042-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AEFA88BE7
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 21:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D5CD3B4944
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 19:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7A528BAA0;
	Mon, 14 Apr 2025 19:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NR5HG/PJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79AD1A257D
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 19:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744657427; cv=none; b=Ur06RZ6EEtz2YEzA7wKp1n1DP8vvTbxEqcZoOQQ/vH/WtG6oU68AgK0yW28HOiJjhVIeBKEP90jCO/+QsnerU6QtkM17RrWSYYA9X1nHc5ERv0LgNdSgholMlkd82U3YZpd9sjW/0KObokohDGLD4Y0aQCu0ij6j0oE6PBREQ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744657427; c=relaxed/simple;
	bh=znL25D6OJj7rt0LH3T7rwAjqZAtNWqB9ebdHxUG13SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5+62C3tUG2Nuj9Q5edT+AR47diBNYxeiq56zU9zvIb76+w8rJKBo0bB42caSD4iM35VWQW550FViYlGB2ohKyQrHzHGt2etJjYoOE83k/Hi/YPNTwWzU/1KLlTcuTZg8p9pocFxKbebc5FsHG+GurDhIqwQNK5yD4Ty2JkGWlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NR5HG/PJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE494C4CEE2;
	Mon, 14 Apr 2025 19:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744657426;
	bh=znL25D6OJj7rt0LH3T7rwAjqZAtNWqB9ebdHxUG13SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NR5HG/PJhyF9ZazwHiMKu0CFW5jlmOaeGg7sCRgqxQAHd00+hCSGPx+Q7nQemLj1H
	 ryVEiJLOW9dB4JYgsNqoq+U1wmPOx31nDXUsELEGDeDCUS3Yp6LB8Sn1iWW9hkRqpX
	 VdiHIRDAjz5JLiEul83Z6rGnoDg19I8FBV4+7TJI=
Date: Mon, 14 Apr 2025 21:03:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Cc: linux-usb@vger.kernel.org, mika.westerberg@linux.intel.com,
	andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 0/3] Introduce Thunderbolt/USB4 <-> USB Type-C port
 mapping
Message-ID: <2025041421-snowbound-lullaby-3450@gregkh>
References: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>

On Mon, Apr 14, 2025 at 07:55:51PM +0200, Alan Borzeszkowski wrote:
> Hello everyone,
> 
> This patch series introduces the creation of symlinks between
> Thunderbolt/USB4 ports and their corresponding USB Type-C ports. The
> primary goal is to provide users with clear visibility into which USB4
> port is connected via a specific Type-C port. This provides the same
> functionality that is already present in Chromebooks.

"mapping" in what way?  sysfs links?  If so, care to add
Documentation/ABI/ updates?

thanks,

greg k-h

