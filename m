Return-Path: <linux-usb+bounces-2073-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8010E7D3901
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 16:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08452B20E73
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 14:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD501B289;
	Mon, 23 Oct 2023 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdQ2Puhh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB43291E;
	Mon, 23 Oct 2023 14:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEC1C433C7;
	Mon, 23 Oct 2023 14:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698070222;
	bh=6vH16FEOHa8dxD2HaGOACPP5M5V5znbbUY7rMFuXZLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdQ2PuhhNMziTwMmg9/EeEJ3CbPiBjLIEnb/EfnjqUDyGdLGJMzQGfW5HAysZK8yr
	 b/O4JKgUxxpouvDOazGmsset5rHSdPkbWBhSv/AeP5pk1rUAODyPuoHo+ocEACbrt5
	 mNLvf41900/nYdAmDUHsd6DLiB8tPuLfsaJuwUW21dhlRYYcd6t3mBIXjVn3JnPVew
	 wYmH4/oQVBUtZmeYX1ibALo+2N3bGZGWF4+2rXYsHX1GBNCR+86R83a5cQ3v7RdHbU
	 LI0vRo8/147tvS9VM0tiZG3Ede/Uj7rMrVCtaNeRRuC9ePR27Pw3v62MruCHRCnLhn
	 8h5lhhpniEdig==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1quvdd-0000Z6-0W;
	Mon, 23 Oct 2023 16:10:37 +0200
Date: Mon, 23 Oct 2023 16:10:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_pkondeti@quicinc.com,
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
	ahalaney@redhat.com, quic_shazhuss@quicinc.com,
	Harsh Agarwal <quic_harshq@quicinc.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v13 03/10] usb: dwc3: core: Refactor PHY logic to support
 Multiport Controller
Message-ID: <ZTZ-3Vick1LBRKYb@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-4-quic_kriskura@quicinc.com>
 <ZTJPBcyZ_zLXbgE5@hovoldconsulting.com>
 <257716c4-7194-4d26-a34c-fff09234628f@quicinc.com>
 <ZTY42KvYCk9HhCIE@hovoldconsulting.com>
 <e640c995-4751-464b-b6fc-106be822ae1c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e640c995-4751-464b-b6fc-106be822ae1c@quicinc.com>

On Mon, Oct 23, 2023 at 06:03:32PM +0530, Krishna Kurapati PSSNV wrote:
> On 10/23/2023 2:41 PM, Johan Hovold wrote:
> 
> >>>> Multiport currently.
> >>>
> >>> You use capitalised "Multiport" in several places it seems. Is this an
> >>> established term for these controllers or should it just be "multiport"
> >>> or "multiple ports"?
> >>>
> >> This is an established term AFAIK. So I've been using it here like this.
> > 
> > Do you have a pointer? A google search seems to mostly come up with
> > links to this patch series.
> 
> Only pointer I had is the hardware programming guide internally. It 
> mentioned "Multiport" as an established term. I think that is self 
> explanatory in usb context. Isn't it ?

Self-explanatory, yes, just not sure whether capitalising it as
"Multiport" is warranted. But thanks for clarifying where this comes
from.

Johan

