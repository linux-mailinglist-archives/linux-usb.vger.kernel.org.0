Return-Path: <linux-usb+bounces-15211-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D81CC97B7F7
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2024 08:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176BB1C22494
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2024 06:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805EA15099E;
	Wed, 18 Sep 2024 06:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWC0Eyx7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305321364;
	Wed, 18 Sep 2024 06:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726641166; cv=none; b=GnIAdrtgUF68Y6Wu64g+yGIY8qqqaVtEllDdGDm2E9ZbxOYfSrCc4trzriU44yP2YYmQThr1RfLplGi+sOlJsWuxUBbKKXRGu/vLwP+/DLJgF63vCgXi6x8AO3Wma6irxr5PTnUC8AR9Tr78r6OqmHGFTfYXwgAO01tAukJeJT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726641166; c=relaxed/simple;
	bh=92bAq1IIGNwnFwppRRlpstW1IZh5HfwF37PcPfL5yrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTYDwURNchDIeAJxulc7nH+4JuZK8tMLu9mq6jfYfZq5r/dhdR6ADw9G6qIxd31bANoq1k+6tLa4QW3/bkBV2mTw9FX6Xo8vrD8a7C7b7DuaXDVmRzzgg9KDxohXC1VZn7Iwh5r2kWhlaxFfAwwOXuGWRcUp1GaAh1L1WwkS/Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWC0Eyx7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4ABC4CEC3;
	Wed, 18 Sep 2024 06:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726641165;
	bh=92bAq1IIGNwnFwppRRlpstW1IZh5HfwF37PcPfL5yrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWC0Eyx7EYDf1v9vzFum+QqcOYTmoTMbJU6tGOrJ8Cqf+A5G01eLZU35SczZI/s2q
	 /vcbhxtFLKwUE8+acCt1TvmiUTMQWDLGmlxdAMpGyDi/Rjt5XREl3qHRPWaQU61rT4
	 Dyov5ntM923AjLI2m4QFZDAqaT2WaK2blkkOgCjF46I5NOmj9AJRJ2QRD01+7TGbR0
	 pXo0gwYzu7VJxAjgkZr3jc28M3/cIEd1IyN3aq0WgXN//vKR1QjXEg092skbnDgdNF
	 NEFi9V2YOP3JsU/YFt5Fm/UdM9RnY5lUAIb7/4D3wEL6tZrWINzn/Am5N/43jXysEG
	 OczDYBz6+ab3A==
Date: Wed, 18 Sep 2024 06:32:41 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 1/8] platform/chrome: Update ChromeOS EC header for
 UCSI
Message-ID: <Zup0Ca7QtatvsCjC@google.com>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-2-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910101527.603452-2-ukaszb@chromium.org>

On Tue, Sep 10, 2024 at 10:15:20AM +0000, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Add EC host commands for reading and writing UCSI structures
> in the EC. The corresponding kernel driver is cros-ec-ucsi.
> 
> Also update PD events supported by the EC.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

