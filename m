Return-Path: <linux-usb+bounces-1920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A975C7CFAC8
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 15:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49325B21358
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 13:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21BB27449;
	Thu, 19 Oct 2023 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euF/Oe30"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFBE2375D;
	Thu, 19 Oct 2023 13:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F99CC433C8;
	Thu, 19 Oct 2023 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697721621;
	bh=VOgijqnTNDtnP5vZfW0kZXy9HzFMq1AfoLyH43H+9QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=euF/Oe30adccYRG1D2KqAdsZH6ES5G29fc3GYvg3jyHVY6vFkobKVbn1riBtcOn5q
	 Z4c1wx3MgCigZGA1EBi2YEoesdyEQKqxjFYLdFhGllTOteXp5i16TUIcRNH4rgW41X
	 cA0Le25PTRec0HIh52GVsWwxcL7z1HbJL6sXB3xyOiT6d9PBj/u11teLTqk7PWiZN2
	 QlvaedlZNZi3tBCzyes9RLtV1cDjE0oSccwDCzEulImuyl5KBhLqQwZ3uSSona6TeQ
	 U+lxWMPNCdk9aiwpYGGLNLLwD10Qa+C8SLKzcANg+Xvv5rbJiV/TOJJOKUskxqbezW
	 ZcLwZdq7m2A7Q==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qtSwq-0003YF-1G;
	Thu, 19 Oct 2023 15:20:24 +0200
Date: Thu, 19 Oct 2023 15:20:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"quic_pkondeti@quicinc.com" <quic_pkondeti@quicinc.com>,
	"quic_ppratap@quicinc.com" <quic_ppratap@quicinc.com>,
	"quic_jackp@quicinc.com" <quic_jackp@quicinc.com>,
	"quic_harshq@quicinc.com" <quic_harshq@quicinc.com>,
	"ahalaney@redhat.com" <ahalaney@redhat.com>,
	"quic_shazhuss@quicinc.com" <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH v9 05/10] usb: dwc3: core: Refactor PHY logic to support
 Multiport Controller
Message-ID: <ZTEtGIerwI90P6aA@hovoldconsulting.com>
References: <20230621043628.21485-1-quic_kriskura@quicinc.com>
 <20230621043628.21485-6-quic_kriskura@quicinc.com>
 <ZJrRe7HtMs0KbsCy@hovoldconsulting.com>
 <e3e0c4c8-1e91-caf1-c1c4-86203a7ecba0@quicinc.com>
 <ZLo6MwbuKNL5xtPE@hovoldconsulting.com>
 <20230801013031.ft3zpoatiyfegmh6@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801013031.ft3zpoatiyfegmh6@synopsys.com>

[ Digging through some old mails. ]

On Tue, Aug 01, 2023 at 01:30:36AM +0000, Thinh Nguyen wrote:
> On Fri, Jul 21, 2023, Johan Hovold wrote:
> > On Mon, Jul 03, 2023 at 12:26:26AM +0530, Krishna Kurapati PSSNV wrote:
  
> > > >> +/* Number of ports supported by a multiport controller */
> > > >> +#define DWC3_MAX_PORTS 4
> > > > 
> > > > You did not answer my question about whether this was an arbitrary
> > > > implementation limit (i.e. just reflecting the only currently supported
> > > > multiport controller)?
> > > > 
> > > I mentioned in commit text that it is limited to 4. Are you referring to 
> > > state the reason why I chose the value 4 ?
> > 
> > Yes, and to clarify whether this was an arbitrary limit you chose
> > because it was all that was needed for the hw you care about, or if it's
> > a more general limitation.
> > 
> 
> Note: We can support many, but we set the current limit to 4 usb3 ports
> and up to 15 usb2 ports.

Thanks for clarifying.

Johan

