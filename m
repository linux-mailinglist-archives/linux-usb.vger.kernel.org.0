Return-Path: <linux-usb+bounces-19664-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D0BA1A2BA
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 12:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A4DC16BC0D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 11:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FFC20E02F;
	Thu, 23 Jan 2025 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmQPKs+2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96D820DD75;
	Thu, 23 Jan 2025 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630932; cv=none; b=t9456/cpngaywr7oTGm6zIKvSL9CNJN2ofy46dpWU3WCySTHoOT9PDS8e+TqazRV0LJmQ2sawSE5S0WkWi8tii4V7HyIAkbj8oiXPJ8LxAW8sRZnpjE3yA3d2SzFoD2gTL5C6n2CSKZJVjDbd3nq1yltDGq8rq+QbfajXxXmK/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630932; c=relaxed/simple;
	bh=3aValOwNaBeJdjq7wkipR2q+sjZZpJgUZBouDuF5gRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUU9sg2XOWDpE18QQXdc0a0ti/Atq7Ul8fuMaoGtrzj4TM0Xjlsn8oD25HENcOAzJHL+vc5j9qHH8WhmrN51wvtMnJJSHvhxLZwoqID/G/aRVjqJE38WKCAEKmK5TfSv7Aq/tS591dBhtHeJ7MBtDiLIJ1l9/G7rSwLvG+Qi0bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmQPKs+2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8EAC4CED3;
	Thu, 23 Jan 2025 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737630931;
	bh=3aValOwNaBeJdjq7wkipR2q+sjZZpJgUZBouDuF5gRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmQPKs+2bnNegdtw0JK554GmZrdrkt9co7xwCJZegg5xPxJsqAHQbrea320Fq1tPt
	 Ki5qPAJ8VnN0OAvkDzNTJXl8BCNt5WrPTA6iLPiiYlzb0OBqvjCX+qaiclHM1hdIdD
	 /u2TCoSpXfjqA+Asi7OM2LXEp+4hTJcHJywApqMB4+7N8lYwQKmKRaVL8pVOLuJuP2
	 Dm5jz4mRHxFD3Fy+25jgusw51GaYKLfiiKvcclfHaloqCOQxNmyW0e/ZI19tQI7LAR
	 lMHzW94Qa5L52DMo45cyIVQp55oHs52+ZBwpvGi+M1hP8Z0hcf17nbdtkUIXS2kp27
	 dDcty73si03Gg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tavBQ-000000001yc-2TXo;
	Thu, 23 Jan 2025 12:15:37 +0100
Date: Thu, 23 Jan 2025 12:15:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.felsch@pengutronix.de,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH] usb: core: support interface node for simple USB devices
Message-ID: <Z5Ik2GoseMbZRe8i@hovoldconsulting.com>
References: <20250122134732.2318554-1-catalin.popescu@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122134732.2318554-1-catalin.popescu@leica-geosystems.com>

On Wed, Jan 22, 2025 at 02:47:32PM +0100, Catalin Popescu wrote:
> A simple usb device has a single configuration and a single interface
> and is considered as a "combined node" when defined in the devicetree.
> If available, its interface node is simply ignored which is a problem
> whenever the interface node has subnodes. To prevent that from happening
> first check for any subnode and ignore the interface node only if no
> subnode was found.
> 
> Example: FTDI chip FT234XD that has only one UART interface which is
> being used as a serdev by other driver.
> 
> device@1 {
> 	compatible = "usb403,6015";
> 	reg = <1>;
> 
> 	#address-cells = <2>;
> 	#size-cells = <0>;
> 
> 	interface@0 {
> 		compatible = "usbif403,6015.config1.0";

Your example makes no sense since if this is the only interface then the
interface node should not be here.

> 		reg = <0 1>;
> 
> 		bluetooth {
> 			compatible = "nxp,88w8987-bt";
> 		};
> 	};
> };

And as Greg said, serdev is not enabled for USB serial as serdev does
not currently handle hotplugging (hangups).

The hotplug issue would need to be addressed first, and then we'd also
need a DT binding for usb serial devices which can have multiple ports
(per interface).

Johan

