Return-Path: <linux-usb+bounces-1562-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF327C8223
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 11:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E51C4282981
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 09:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC721118F;
	Fri, 13 Oct 2023 09:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPTnQ+rD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE0210A38
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 09:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209C1C433C8;
	Fri, 13 Oct 2023 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697189811;
	bh=nGidJefYS0fjwYiFMux8/uiRpSBOmVD4Uh5lcHFMiNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPTnQ+rDXHvObxhCe+CnjzubVONqUIElyDHvJWLwOheqxqqiKfRNMY2/v/SXo3+MZ
	 u9iVecrETs3p4Tta9isRTvsQMxlgz9qu0Tm/KyIKmHuD4IiCl9fPbxLCREdC0yUQqF
	 IGJRkqUgc8xZJfLN/9ZnZ2lSVwnOSOYQydU8Sx/kiqe/7BsnjWzt+GusyCHcgQ4xfw
	 opbnh/QHQrPstlROJnM01+XdY//CKr1lE8aZaV6L7LH+2CKri4u/J3LHRv0f4R15Dt
	 ykUMW8hpr8cSJLpkp/VpumPSKZfxFdYg1ApmeVEIFeHVXP4qh5Ljxvz3Fzu4Pof98h
	 KX0W/m28MYavQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qrEbi-0004Tu-2I;
	Fri, 13 Oct 2023 11:37:22 +0200
Date: Fri, 13 Oct 2023 11:37:22 +0200
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@gmx.fr>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: serial: option: Sierra EM9191 with new firmware
Message-ID: <ZSkP0oM4ttRgILFy@hovoldconsulting.com>
References: <f72b49af24b281f80bb217cff04d0cc249f229b6.1696261301.git.benoit.monin@gmx.fr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f72b49af24b281f80bb217cff04d0cc249f229b6.1696261301.git.benoit.monin@gmx.fr>

On Mon, Oct 02, 2023 at 05:51:40PM +0200, Benoît Monin wrote:
> Following a firmware update of the modem, the interface for the AT
> command port changed, so add it back.
> 
> T:  Bus=08 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#=  2 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=1199 ProdID=90d3 Rev=00.06
> S:  Manufacturer=Sierra Wireless, Incorporated
> S:  Product=Sierra Wireless EM9191
> S:  SerialNumber=xxxxxxxxxxxxxxxx
> C:  #Ifs= 4 Cfg#= 1 Atr=a0 MxPwr=896mA
> I:  If#=0x0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> I:  If#=0x1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=(none)
> I:  If#=0x4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> Signed-off-by: Benoît Monin <benoit.monin@gmx.fr>

Now applied, thanks.

Johan

