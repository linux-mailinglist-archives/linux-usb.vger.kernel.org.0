Return-Path: <linux-usb+bounces-35176-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGiNEcFVvGkXwwIAu9opvQ
	(envelope-from <linux-usb+bounces-35176-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 21:00:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A824D2D1E4C
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 21:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F2A131C9CD5
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 19:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C67F3AEF3B;
	Thu, 19 Mar 2026 19:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igCKvKmv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRs4nQd+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC4138D6B9
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773950272; cv=none; b=mIgTvsvYItmHtasbn6lOAAnlsQCx1XtGbqgTuoTeHfrviJ8u5XCNwk1GbJmiRqIojL/oje+BeJcGuXMVdYnWnS+SPKtIaInqF7orxpFaMRWRzO6NKSg2uUXLjJpxlSIxfqRIPlltBAZCErrTQTSNBmMVulCrmb4dCgM9shgWqeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773950272; c=relaxed/simple;
	bh=QTwvb1ZJT3oJv5zwjRyjKoW8qMSMYBlXk2HpDND/G6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIX0X5uWfZpdJPJKbFN6q2FnWIco0ap3Zxq6QN/doXBe52fOViRmFK0iW1oGbMxyJTp+cHyWhXy8zdt1zfuxKqPiv+50YUyA5oaB8AfK85vycXAiz2h6vgzG6EpQBoLJAoUdtA7SBHfpTTArQ2GKlNBXTX2etDqGQj6SMU7QSaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igCKvKmv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRs4nQd+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JJdDFo2759246
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 19:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rk3f6EEHA5oOnawd7HAGIDoZ
	n7P0Q/hRPCGN7St7thE=; b=igCKvKmvZx69PZpa46RBdOuaNrSzGMtbS5Hva5yH
	WVEJ4tJxjBs74NZx0J1pd01wSYugVB0ZxLlsBeJAF/kX07MdgQA1k5nxIr2WK4eX
	FjTwcBwpU5ARlc92fl0tpMpqnC99M8zB5NjG1YUL1PD7UC+DtKm99ZCwMx/UP8/d
	kkx+znJ1kD6okUcdo2rTMeMlzchkcEde4YbNLfhalxTxqmC6SG5qVY9kx/YRSDVu
	dLjkuI5lXdhbPNJ0oRzYP/oOfGTD8N/IOIbK/o39TQBQQaUDY0fXrGPv5vqdHQuG
	ySOl/xCkBmqoDQmj7n1lF2lLJSCo9wFNm9G10uahicbwrg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0qg781d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 19:57:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2cbe7223so61626381cf.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 12:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773950268; x=1774555068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rk3f6EEHA5oOnawd7HAGIDoZn7P0Q/hRPCGN7St7thE=;
        b=IRs4nQd+p7hvbteStTRq5OEMVY1qhBdXx0oW8zlGVnjvauq3/STwpmjXI05/gVWRSu
         Kq9ZoAb90pvS1fr/nHXauF+2SyjngkNz1byXyC/ZSebBrhJJO9KElQIvqEF/9O+vQpxM
         eJnHzTJQ5tMsTJck9BbAoRz8v/uth83QUAPedRCY0dWImCKpIivWz0w4o+nAkJw/5wFS
         3G0PYE8g1/zWXfKpMn+GonNhuTuHb2yPz+W5ztrs0EUcMZdkWNROmhMPSoL6slDWC+sW
         fqm1ZsTFyn7v+gX7bzhA7DJ3f0ugItj702XTEj/m/mjytQWi2M3K8bHKyJT8i5jLXyZP
         Q8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773950268; x=1774555068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rk3f6EEHA5oOnawd7HAGIDoZn7P0Q/hRPCGN7St7thE=;
        b=VKOAxEWw43m7lYCYA0KjrstDLSdocLCbJdURBYjtZEzIBbnDF1qH3Tm54MUXNGkUaj
         TWr8wQRZcy3aVzd8PmihYsmkaofr7eo41UakXUEi6IKwEJ3newUuWtbxFYILvVmIeEGc
         VJk2jGcps9hI/mcDWXKaW3VyFZRrqNFosLpAySFGoATlR540hdqI07/lD2iHrr1cPyDg
         ZQVy9pPlVjIgvawa3kLBa8s1wQ8umiRDUQ6oWMrR6EBwTamwky0UK6itOzMcnum1Wxtg
         mfVLxWqGWRIqhYsUAGS5LcEAQVZEL2gheatHYLMp/OfjsnPUTEsYLbW23suqW4spVmnT
         MPKg==
X-Forwarded-Encrypted: i=1; AJvYcCWMngfTzdnPO4X3yhnbsxmFlcJSK3gZ9EHlnRH2RvSBnqOmrjSkNJA9pwl7X9OuGOiR3T+VK2iDK9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyanQs+mOnbYeiXIM0GXp5sQyd4ARjFCAg3V31cmLwyntZxJafP
	/W5EoxcQoZYux+6UrY1RimZERFBjEBNAMCwlciji1VvFzSQWbTU/PkSTIHfkzqrvCBkxYkdzvIc
	lW8iNkY267RZtDtgmqW+jeXBcFN2IX4Z48hG4Hb+/9L/L+MlI4N8i/HwZ1u0omD4=
X-Gm-Gg: ATEYQzwDeNWRdRN+uz6nrK1sqvwAOYoQDd2WTsUOWJe9AByLaiZPW8TzcyRgBDcJ5M8
	ouEsN/h0DKF57JC5/5Yk5HEFU8ot88PCi5k1/CkQD+PtIeXbM9gRmm4uZBmSiC/QU3Ave7oAkb1
	8A+8/ppOIlN/XsY+QOW1ruWHPEJ0HkYoK6EbOElLwE5fVMyD1obL2pg6hO9Mz/zoygvDGSxuil4
	JDTVE+Jjf2ETJkYVizxqvDOK2CXKtHA5QtilBpa9xWKCqTUdpt8EdjINZ/uCbKl/8rCVauFWZ1Q
	99gf4usKlJPMXLKaLFlUqUJBi+I/k5PAM1ooVEJWBJjgu+xxzc1lIUJidcQAK0Wih6kBYhrju9M
	e7/q59ILpK72JHZ+x90AbZ5kSfEhFi4QuNMjgAbO8SOb4F4RlE6mzb1QieGaoZnseZgFlEGXE2A
	S4iSXKDkoY6DwFx+cYxT+DoWV/1bWjbxrQ0tw=
X-Received: by 2002:a05:622a:4185:b0:50b:2763:2bc0 with SMTP id d75a77b69052e-50b3738f13fmr7762511cf.8.1773950268417;
        Thu, 19 Mar 2026 12:57:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4185:b0:50b:2763:2bc0 with SMTP id d75a77b69052e-50b3738f13fmr7762151cf.8.1773950267968;
        Thu, 19 Mar 2026 12:57:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aac6f5sm1009811fa.33.2026.03.19.12.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:57:46 -0700 (PDT)
Date: Thu, 19 Mar 2026 21:57:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: qcom: Add support for per port VBUS
 detection
Message-ID: <pvmxnx7fmcdli5qoanmo62mmoxd2vslh2ujbka4cfmxyo4hxl6@dueec5hukqi5>
References: <20260312-qcom-typec-shared-vbus-v2-1-99ed9e500947@pm.me>
 <1fd9048c-b0c0-451a-a6f7-e5474352d118@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fd9048c-b0c0-451a-a6f7-e5474352d118@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KXCruUPxcgEwXljY1763EFfcXmWEr2ur
X-Proofpoint-GUID: KXCruUPxcgEwXljY1763EFfcXmWEr2ur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE2MCBTYWx0ZWRfXzW/OnR4zIqIK
 Lui4X/WycK7KBmhwHsxScTTCAWW6M4kSuVjKOfbbwBFgwE/c6xBh/vX1lMywrVfHnphf9sdLo3R
 Iob0H6Zgi7bZAqr8AQGQcMurytC/oT55bMusoSXVbB+C7r5iTpANWqfQPk4WHDz+8X+xVfLCpxy
 6xc9Z5E/pBrc/ASyKPd7sh0GfDLf/UhMELN28JeQ1eLy4MtOdvW3s0prcOnvswndT223zXNI/tA
 elh/J/PN/hUMG8lLkH4jHTtoabLxkmN42g7XXwLu9Rkyz/eol911zLyARfOBw09XpoctL/7vjDN
 Wy0UbGQZUUTiuVZ0qy73SacgSXDKCumZw+0WbZRkVfm5TEUwp+DGZLiTLeziLPttxrv/vvDArIt
 igCpq1ppvol3Byzz2f7WLviTeq8RS03ZhY1LZKj3+ObjQSICtOlC8GHFifDJcdl/oq6GpQ5cEXA
 ysXX4SAYR+yHHTnsBnA==
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69bc553d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=-RDpsTWLj3jBixvrHa4A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190160
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35176-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A824D2D1E4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 02:26:00PM +0100, Konrad Dybcio wrote:
> On 3/12/26 7:16 AM, Alexander Koskovich wrote:
> > This is required for devices (e.g. ASUS ROG Phone 3) where more than
> > one USB port can act as a sink and both share a single USBIN input on
> > the PMIC.
> > 
> > Because the PM8150B uses USBIN to determine VBUS presence, a charger
> > connected to one port causes the PMIC to falsely detect VBUS on the
> > other port, preventing it from entering source mode.
> > 
> > For example, plugging a charger into one port prevents using the other
> > port for a flash drive.
> > 
> > Fix this by adding support for the vbus-gpios connector binding so the
> > driver can use an external GPIO for per-port VBUS presence detection
> > instead of the shared USBIN register.
> > 
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> > Changes in v2:
> > - Dropped RFC prefix
> > - Remove redundant vbus-detect-gpios, instead use existing vbus-gpios from usb-connector (Dmitry)
> > - Updated cover to better describe scenario where this change is relevant
> > - Update comment for EN_TRY_SRC to make more sense
> > - Skip vSafe5V poll too not just vSafe0V
> > - return gpiod_get_value_cansleep (Konrad)
> > - regmap_update_bits -> regmap_set_bits (Konrad)
> > - Get vbus-gpios per connector (Konrad)
> > - Add bracket to if (IS_ERR(pmic_typec_port->vbus_detect_gpio)) (Bryan)
> > - Link to v1: https://lore.kernel.org/r/20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me
> > ---
> >  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 53 +++++++++++++++++++++-
> >  1 file changed, 52 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > index 8051eaa46991..a8f6687a3522 100644
> > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <linux/delay.h>
> >  #include <linux/err.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/kernel.h>
> >  #include <linux/mod_devicetable.h>
> > @@ -176,6 +177,8 @@ struct pmic_typec_port {
> >  	bool				vbus_enabled;
> >  	struct mutex			vbus_lock;		/* VBUS state serialization */
> >  
> > +	struct gpio_desc		*vbus_detect_gpio;
> 
> I'd like for this to include the word 'secondary', since it's not obvious
> that if an external GPIO is at play, we have two ports connected in this
> uhh non-standard fashion
> 
> perhaps just secondary_vbus_detect_gpio

In theory it can be used even if we have one port.

-- 
With best wishes
Dmitry

