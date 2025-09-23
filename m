Return-Path: <linux-usb+bounces-28503-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B3B94129
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 05:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBC7D162FF0
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 03:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D0D24679F;
	Tue, 23 Sep 2025 03:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWJ4ysUo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF6222D9EB
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 03:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758597086; cv=none; b=CL0+YOG1zlhP1nFVl++7lBigLoGZdCD/DjZ/tiVxPdWEcyzbb+gnK3gzThP4xbdmvenm+Tv+m+4aZcE3Y4pEnkJWhXIkI7hga9smiEgUtpfMTerzdDAFlpNrE2BvEeKtFDjg+zr9Mj0ZtcAM8XuUo53WeE4dVJqUYTdy4di0X0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758597086; c=relaxed/simple;
	bh=g9gL7m1XiSkszfIBHVknyDHouYmqrwfCXDpKI71pekM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwWGtFAAWf4bXrj4RqdFToVWeQuRcZ4JQpTIDNbJGWrx2TLgebxSunKBy6Q9HuKicVUKzyL8tBWzd58BfwzfoU+o6fG3H4cc/k7ljAvD2q7efdPrLum3LSoLhSnYgtx/XDCucr5VVNEUO1geddFRWBQe2Pg9UlIxdcWc8dJmGfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWJ4ysUo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MGb0wR031908
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 03:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzjmHo8UExNyts9a86c5rOPRLwbouhg5B9NyY8BO0dc=; b=FWJ4ysUoiA+7goX3
	Sw8tvcUNtLYwObMlIva6KQ1rsrh/Ucn8yHS5x9cAXs5QCz6Z4Ckm+rxw/wVqiix1
	fNb1sY0Q4KSn2R1KiI/fiihPtSO89XK6G93tQnK2G2W3ky83HTq7kdIYvj0ehwmo
	r7PQB4SRFqhXvpvibC1NGsXAZfdKi7+8Xak0ddtawnQ77imX46uctmBbDDCmTVAI
	O0uGp0QqCwQafrHGoq8Btq7QM9rifgCIwPqKbKndwOOT1T7cws5LhkQnmucn5egI
	YOKo+ZrK7b9IQWWQ8XLv92DvfliXwWSjJVyAlU36gVq/dfRC5NgX22BiXeYdjNOe
	EHCd7g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeq79e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 03:11:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7d438d573e4so31157026d6.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 20:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758597083; x=1759201883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzjmHo8UExNyts9a86c5rOPRLwbouhg5B9NyY8BO0dc=;
        b=H1IeTYFDrq7RAAzb7//cdNfPtjWGAvdOywJS1d00waINqGajjK4mMtv8dJLl464u6S
         sHVgLZ4q+gPpIDGGKsBepYTrY5r2LYB0eGZnB0v/ZpZBYMxg6Fm1wJvopGaj02zVAAwe
         Xc4lyBzfkGlrrcZgVDpYyPjiP2XGsKk+62MoVzy9CzSrBZ0Ag2rkhPOD/fHhx96EO6AA
         Ml65yVeSwYEp4k7Si8tq98CG+V6+KYufQDZEYM/jDJkKamztfdEqQaz0VezAvJdgwJKH
         D/lfrsD4e62U8Zc5PDlrLr5WK4uuUSILFCpPfSjkE8vvxCceDY4BmHQmkSqq/0KTQS0u
         DySw==
X-Forwarded-Encrypted: i=1; AJvYcCUhbx7FXMGojAPM9fiSfpuLV/ek3BHzYL2eqS6/AcVN/ZHFVTOZv+sApU5d+FI7Qt4v4smCKL6S6rI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOXUhUB2LwSp+nWIRj4UGRqDNUh6jkJRR9B7edx3vbhv5L6n5D
	cLX9CVAq7c0dxkqTGexhR3HpGbNd8ElgjlS9qkRqET2ke81APG7+I2dzSTBnYn5MN1IQASVTQl0
	jW4GLhpSiOwxxZQrQ7y+JNF0LdShRZV7jGlTk4dIopzVPTGJillQ8kg12ZYWcTAU=
X-Gm-Gg: ASbGnctrWnlDivfzKMC65KimPyhAB0kuUHQW0y38nFUaAQ553R6i0GFPSt4yTO8+HJn
	5cfGyyrHw7B2uT5ahouSEyv6gSjZ1Uw+TnBsDPfDW9jc37qwl48YLTHo0QndY43M/smVJC+kR7A
	fny4DUXU9GhYocFcAxmcAmR78s3AQ9XvryDaeZNHMEyXK25axtfhKJZHmWjnO5o0MktuwWZHKEP
	UGfepYL9YG69EwstpKWmg/ElHqHFo31wcC5f3DA4kVIbOWVTbgONLSEOySMbeDi5aeGhdoj2ynz
	pb+97cVYwQ/N9b4hAjGMkkW23gvtItkDd3mH477IT+eUEzgNQZXclye9Loko08fa6G4691KrWjJ
	SPJi57AeGF4nff4BXVDSg9lLL2RAj6D7cpA+KF066PMe+yPRbSOO6
X-Received: by 2002:a05:6214:2405:b0:787:f736:bc66 with SMTP id 6a1803df08f44-7e7a024aa9amr10990226d6.1.1758597082849;
        Mon, 22 Sep 2025 20:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFrgxll/zPiyK2YOBX6xrhw1Zdt0GXMRnRefj7dBxaqcSjZF4iPJ6LotQxs+XBMp15xvm8ow==
X-Received: by 2002:a05:6214:2405:b0:787:f736:bc66 with SMTP id 6a1803df08f44-7e7a024aa9amr10990036d6.1.1758597082225;
        Mon, 22 Sep 2025 20:11:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a90a1dd3sm3671866e87.75.2025.09.22.20.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 20:11:20 -0700 (PDT)
Date: Tue, 23 Sep 2025 06:11:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <sgvrzhbhkzxbuybmws44kyenhfyppm3blijkarypcin4fiscvx@mnajrlmicyxi>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-2-kernel@airkyi.com>
 <mygbqhiom6pkwsadzz2bqf5bth3ogsbd6iku5a7r5swxrakein@fjhz7udnkcks>
 <e9cf0aa8-ed32-4ffb-a755-150742455808@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9cf0aa8-ed32-4ffb-a755-150742455808@rock-chips.com>
X-Proofpoint-GUID: mJaIqXtsg_AHnvUOGFaYGSXqwIpHbBbr
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d20fdc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=s8YR1HE3AAAA:8 a=wnU_q0TmBvglJHqaN7EA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXxpClBCGM1eWd
 DoJcFlbp2x7RgNAr04lYedMkyV7y3Dt3otf4BXlkqA3pW0d7ZsbfWbYi88xEGmgrQShywOI8ldp
 elE/DFcMGMaaPrOFv3fUqouPDZhPs8JV3bTjqOHtrDzxF9IqpG2D2h+QkjvfKI2lzljqMdmqtu5
 8cCGAxD1+NkXcCp5LfN0wqPYdmsrF83OhCHZAFWCl0HwaZIRC28a2Mky9adTZ6bu20pz3wf0uaL
 vDU7xqnMqK30MmY0Vb0yJMhu16Ox8wsnmj8vwBLvXyn9iyMRL2HTd74eYxG+H1628uMEuAigrdF
 /yYJHRMWxkRSAORRMEPrkzHgB+t4vIxLSQlaNOxA3ypXTPEcmMaNzwt6sZIfM2Y9mthOx1L1YLG
 fSfOE10H
X-Proofpoint-ORIG-GUID: mJaIqXtsg_AHnvUOGFaYGSXqwIpHbBbr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

On Tue, Sep 23, 2025 at 09:34:39AM +0800, Chaoyi Chen wrote:
> On 9/23/2025 9:10 AM, Dmitry Baryshkov wrote:
> 
> > On Mon, Sep 22, 2025 at 09:20:33AM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > Add default DRM AUX HPD bridge device when register DisplayPort
> > > altmode. That makes it redundant for each Type-C driver to implement
> > > a similar registration process in embedded scenarios.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > ---
> > >   drivers/usb/typec/altmodes/displayport.c | 27 ++++++++++++++++++++++++
> > >   drivers/usb/typec/altmodes/displayport.h |  2 ++
> > >   drivers/usb/typec/class.c                |  8 +++++++
> > >   include/linux/usb/typec_altmode.h        |  2 ++
> > >   4 files changed, 39 insertions(+)
> > > 
> > > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > > index 1dcb77faf85d..e026dc6e5430 100644
> > > --- a/drivers/usb/typec/altmodes/displayport.c
> > > +++ b/drivers/usb/typec/altmodes/displayport.c
> > > @@ -14,6 +14,7 @@
> > >   #include <linux/property.h>
> > >   #include <linux/usb/pd_vdo.h>
> > >   #include <linux/usb/typec_dp.h>
> > > +#include <drm/bridge/aux-bridge.h>
> > >   #include <drm/drm_connector.h>
> > >   #include "displayport.h"
> > > @@ -182,6 +183,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> > >   				dp->pending_irq_hpd = true;
> > >   		}
> > >   	} else {
> > > +		if (dp->port->hpd_dev)
> > > +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > +						  hpd ? connector_status_connected :
> > > +							connector_status_disconnected);
> > There should be no need for these calls. Once the HPD bridge is added to
> > a correct fwnode, the drm_connector_oob_hotplug_event() calls should
> > deliver the signal as expected.
> 
> It seems that only drm_bridge_connector can do this. I'm not sure if I remember correctly. I'll give it a try.

Other connectors can implement the .oob_hotplug_event call. Calling
drm_bridge_hpd_notify() also depends on the connector setting the
callbacks via drm_bridge_hpd_enable(), a step which is done by only a
few drivers.

> 
> 
> > 
> > >   		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > >   						hpd ? connector_status_connected :
> > >   						      connector_status_disconnected);
> > > @@ -206,6 +211,9 @@ static int dp_altmode_configured(struct dp_altmode *dp)
> > >   	 * configuration is complete to signal HPD.
> > >   	 */
> > >   	if (dp->pending_hpd) {
> > > +		if (dp->port->hpd_dev)
> > > +			drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > +						  connector_status_connected);
> > >   		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > >   						connector_status_connected);
> > >   		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
> > > @@ -391,6 +399,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
> > >   			dp->data.status = 0;
> > >   			dp->data.conf = 0;
> > >   			if (dp->hpd) {
> > > +				if (dp->port->hpd_dev)
> > > +					drm_aux_hpd_bridge_notify(dp->port->hpd_dev,
> > > +								  connector_status_disconnected);
> > >   				drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > >   								connector_status_disconnected);
> > >   				dp->hpd = false;
> > > @@ -751,6 +762,18 @@ static const struct attribute_group *displayport_groups[] = {
> > >   	NULL,
> > >   };
> > > +void dp_altmode_hpd_device_register(struct typec_altmode *alt)
> > > +{
> > > +	if (alt->svid != USB_TYPEC_DP_SID)
> > > +		return;
> > > +
> > > +	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> > > +						  dev_of_node(alt->dev.parent->parent));
> > This needs at least a comment, what is dev.parent->parent. Also, the
> > of_node is not correct here. It should be a node of the connector,
> > rather than the device itself. Consider USB-C controllers which handle
> > several USB-C connectors (e.g. UCSI). The DRM core won't be able to
> > identify the correct bridge.
> 
> I think  alt.dev->parent->parent is the connector device. Am I missing something?

As I wrote, it needs a comment (in the source file). No, it's not a
connector device, it's a USB-C controller device. There is no guarantee
that there is a separate struct device for the USB-C connector. On
Qualcomm platforms, the device will point to the USB-C controller (TCPM
or UCSI), which contain usb-c-connector(s) as child node(s) in DT.

> 
> 
> 
> > 
> > > +	if (IS_ERR(alt->hpd_dev))
> > > +		alt->hpd_dev = NULL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(dp_altmode_hpd_device_register);
> > Having the function here will bring a typec -> displayport dependency
> > between drivers (which you didn't document). It means it won't be
> > possible to build typec core into the kernel, having the DP AltMode
> > driver in the module (which also doesn't sound like a good idea).
> 
> It make sense. Perhaps moving it into class.c would be a good idea.
> 
> 
> > 
> > > +
> > >   int dp_altmode_probe(struct typec_altmode *alt)
> > >   {
> > >   	const struct typec_altmode *port = typec_altmode_get_partner(alt);
> 
> -- 
> Best,
> Chaoyi
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

