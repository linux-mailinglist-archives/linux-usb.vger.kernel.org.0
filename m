Return-Path: <linux-usb+bounces-11492-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD5E910E8A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 19:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A1E32821C7
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 17:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876CE1B47D6;
	Thu, 20 Jun 2024 17:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NJjJKe5Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F811B47D2
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 17:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904607; cv=none; b=TO8xxkHKMg2Ll8hVwMP+bVtBYGYeIZ0fPnhcYzgKUTHyTyYqNycbQrGkKjDIfhtn3E4ZSOmqGCQ1127eksI7srW7+tjm9IxzzNiYWMqkBuhGQ9WH0YAkOX5W5niOW1bEBWgKuLnbiPj74UQB/2q3TAcpQIy+xuEoVm7lyAbIZWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904607; c=relaxed/simple;
	bh=MMPMhMqKb+n6C3/H88oDRzlkPT5K7sTU5zXwS92wQNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVuq15UNre85pifEOiBQpPsjR8gPGLo/9e5XPhsBgSzxigxJsOHS4up3BeBrt94oc63wbSn+l8fGtlQ4pxYlHqComRDEKSQ3+mJVqR3SKkFR6SGbD3I3U8WTe789L3az9iAnnA+alNP9EszXTexT97wTZN5PwKr1uFwhcYKJ/Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NJjJKe5Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D6AC2BD10;
	Thu, 20 Jun 2024 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718904606;
	bh=MMPMhMqKb+n6C3/H88oDRzlkPT5K7sTU5zXwS92wQNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NJjJKe5ZgpMcwXe8rQruX29jrKG2bmKds6Uy5mOC+HWlAc9R3li8i5UV6bQEqYWl0
	 YjxfozC1C700JzMcrg9yZrGhNSLQNXkT/ZfCE4n3RDjskssUCWYU4RaiiN3jzYb7fX
	 dL9ZjGxOTGWOEeGB+SY87BD9KuC8KDArVJ+LElaE=
Date: Thu, 20 Jun 2024 19:30:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com
Subject: Re: [PATCH] usb: typec: ucsi: UCSI2.0 Get Error Status changes
Message-ID: <2024062056-anywhere-paralysis-249f@gregkh>
References: <20240606003211.1337526-1-pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606003211.1337526-1-pooja.katiyar@intel.com>

On Wed, Jun 05, 2024 at 05:32:11PM -0700, Pooja Katiyar wrote:
> Add support for UCSI 2.0 Get Error Status command to add connector
> number field to the command structure.
> 
> Connector number field is extracted from the previous UCSI command
> which has failed and is used to get the failure reason/Error using
> Get Error Status command.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
> ---
> 
>  drivers/usb/typec/ucsi/ucsi.c | 29 ++++++++++++++++++++++++++---
>  drivers/usb/typec/ucsi/ucsi.h |  3 +++
>  2 files changed, 29 insertions(+), 3 deletions(-)
> 

Does not apply to my tree :(

