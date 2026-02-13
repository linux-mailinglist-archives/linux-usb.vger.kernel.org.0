Return-Path: <linux-usb+bounces-33339-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BA8LBlqj2l5QwEAu9opvQ
	(envelope-from <linux-usb+bounces-33339-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 19:14:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E97138DA7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 19:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25FC3303CEA1
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 18:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436B6364E9D;
	Fri, 13 Feb 2026 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asBLJt8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ec4PmbSK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4DF17555
	for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 18:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771006479; cv=none; b=Fchlo91ih+qGKtzLsW9c3pxCPfHfsAJpUUBwCS1CoeMKxLXR5AUZ4fgmosoGHe2/jNE3FzZOU9qvd+E/CZr5wSJ/MiIUZhTCz6P4Suhhh1BnYI0PmCT7KG0pg/a03djdasqUu4JKOp9o3bltM+VzTxHONYbpW8yYax7kO1M0KSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771006479; c=relaxed/simple;
	bh=u/rpaae1IDnyg5s0tNifd4aX4nvH1aVD/IXOvJ8u9Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efN/r/pztIVwbO8hvxZHcSx7Fx8QKVDImvqEun8iCqk0zRQHbTBCdOMCaKqQ8yAGDvTpSSwjcZ5wv5VIPAO+wNTNJubyyBIM2XK9VviX+IjqxXEy9A/Vw6J8KgdaLmcgkO6QDKdSogIiSJxX8aSuuDWhi85WSKvYLoKAchLpG6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asBLJt8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ec4PmbSK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DHRhBk3797875
	for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 18:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZ5stmA+ligiIPXdwSHOzyN4tARmpCLcS1UdsIpjm9g=; b=asBLJt8GZJvgvKHK
	iut12EYlLv6iU003OSZ3VN33aub1v5poq99GAraUTemRWdd/Ovmcb98eqpHk+CpK
	KHs/JQUwN/VVus5PGSKAPq+2ladr7b4QTPvajP+JRRGc55690KRKhayT+olbD8LU
	2aRuQYpltR5kDXesYwX0QWBpNivvI6sE9PUWlt9YMJoySbmd+OrygDA4AmPvEjOO
	2NcJVfjZaFUaYuL1iB2DbO9mWPu1ywLXKjW712uSZyfD1+ZMgt9H215TfqB3jqy0
	5hY7wThJ/rXbYDkI9ArejUUTt8m1MI7b0DhXsy+BwXaeotopcU4aNM67Y60cXEHh
	vY5UWw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca8ca85cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 18:14:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896f96458f3so81204336d6.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Feb 2026 10:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771006476; x=1771611276; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZ5stmA+ligiIPXdwSHOzyN4tARmpCLcS1UdsIpjm9g=;
        b=Ec4PmbSKMe7rXKEvNadw0fOu4cUUwzlZ4eTnifD7p0wPNqXdMg1WSuwRR489/KPD3C
         j+z0F9yWQEZzu5KOYxN7K6fNaLkOQuKWMId/NPFovhVAjqkSU0My0AJWiLhwLHaZFdQj
         xrXMUknv9AEtqtmuA4H3KQMSJIKdo0e10LTApZZlHF32gvbrc9GHyykKfnyIfTHpvvfU
         swyi+hPvLP4VNkCzfTrqyLr5YMIEyLOr/jJXr9zQLai+8BHEMeUjMnzPROHngvj+KFKY
         A0pPMeT26FZU8ZLw8ZvjBYUszuzUESWUEFIppJbxYGY2KsJ140sHR0W9Igx+cobyBcW8
         0tXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771006476; x=1771611276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ5stmA+ligiIPXdwSHOzyN4tARmpCLcS1UdsIpjm9g=;
        b=ua2ubPY4GbIfc1G/YbLNH1gIQfKmbsWRHpFG6wbDxTljcs5D6uDlcE37PqmMQi2mme
         fWc5vSqt17/F1U2lVLpF61OxmdpmA75aWTgztcTgQgE5s2LArPBc/7P7ead0rAKPE54g
         ntvdCbiToXxMrfF1oJW7n6LczpG084Q0Pirb6yVzV9jk4mgl6AAcES4iSY7fMdWH+LCT
         9T5t4MDaFI5AGOLV1VMUl+f489hcVLYiXXx+i01WAQna+iPyY7RI2EdxcHvx2Ii/aHH2
         SlZYjFud2ALFKp5AnAZaTIvHWiopeYZO2UqmHzhCIv0I08YHNGD9JqJrX9W8232wFcmD
         Q3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtzoMZwbk8yskQDcrGpdEykb4heqtLs+S0RueePBwWXKB+xtFLha+E3MtLvF/XgyjrR+Bb4lI/gCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrxei8asWpw797COSwy44ICtk7h4VJDAm1UAMs8l4fP3RhDtDW
	c2eqVvGVQtS3CafqL+pg2cQoIEu2g3p/hzHimgQ2ed8VFTM39BUxjWauRslB3H/m6Dv+67sMrsJ
	MkIHY0cSzQZXfWd/KbzhQoc/pu5nP/cU3uljVg7YmRYHtMn1DbKS/DNQ16xTOBX0=
X-Gm-Gg: AZuq6aKkagIgQAvHenpSD7RzJ9OBnk4QOBicEAz2ZJBhT8TDSldI9IJhJQI/TH65Yr/
	tTIfOH1DGsO/ErkPhN3efNRUtu87NI+kL9Glk5UV5Nm3mqQQBnA8UvjiXRpZ0dH2Ail8OW8XqNt
	uhty9oUXRGtBTIDfNZEGmxbWp1lFAvYR5S8rfw0XnTLtV2DFdFTkNikW+V/i5UsLEgNPRM0FiZa
	I0ZiuaVmCYMcG/FAazAl7GOBLaOZMfuwVRB0wxliYCwJNr2pkEBKgXd1721rA37fdlCuDTM+dD7
	sk6P5nHs8fqI9vMPX+7be22trFnz/Ao7FqcOOXHy/+zEGJg7mCL3ZPVG+JU/HE1B1pIYgjvnesY
	gDcDRm4Hcz90r9IJtNtTMp03wECD7oqII65IQ/W01JXxb9S9KaeoKb0Ui2816+A2moCEsyk45Ji
	Cx7E+grtsA4VtSZ3ejYFEKpdA1cNv2X+KLL68=
X-Received: by 2002:a05:620a:370d:b0:8c9:f4eb:ac71 with SMTP id af79cd13be357-8cb4bf97211mr61285285a.10.1771006476160;
        Fri, 13 Feb 2026 10:14:36 -0800 (PST)
X-Received: by 2002:a05:620a:370d:b0:8c9:f4eb:ac71 with SMTP id af79cd13be357-8cb4bf97211mr61281685a.10.1771006475665;
        Fri, 13 Feb 2026 10:14:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068e5e11sm13667171fa.21.2026.02.13.10.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 10:14:34 -0800 (PST)
Date: Fri, 13 Feb 2026 20:14:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <66tmy6tchqpggvitzumaw3leg5pd5wetfgu5ybgwjnj652qkgh@a56ws4hfinaz>
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
 <20260122092852.887624-5-swati.agarwal@oss.qualcomm.com>
 <63fjxtcmpbpna4cuuis332y3p52b6pvh43gyg6m7u5kiwkb2pb@znwfyet4xlpc>
 <CAHz4bYuR_LZXh=tS2FJ4VE9tVB6vN10pd-9i=uOL35sSx_BRzg@mail.gmail.com>
 <fycr33dqcosay7ake3nbbeaclhqvynwzixas4u3ocaerpqbu5e@shoibdd663vm>
 <6a982b56-2f4c-441f-acf7-a8e77ea55600@oss.qualcomm.com>
 <421a0916-ae2b-44a2-a3bd-ceca0737f334@oss.qualcomm.com>
 <CAEiyvprpC-kZqonKJxQtVLUH1Yz6_U+RvhJ-s-ywotLAGYxX4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEiyvprpC-kZqonKJxQtVLUH1Yz6_U+RvhJ-s-ywotLAGYxX4A@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE0MCBTYWx0ZWRfX+fCjnCZKWKon
 3ivMb4yx+JwvfXJB65JjpOG0Bfeu2tFKdPQm1u5H+IKdMJJeVHVu3eS2tmXxIxbcggIxI1fskFt
 Vx4kSPwzx2zmPfu1YUiZlneuLURp35YHB8EKK568/vQbxxF8Jx1wOdVSBVUAGBDBaUj4auJ2Xj9
 ssVIXok8aCIP6x8EVnwvwzs9+tzJTkkwNsTPv+2Ce/amiLU+NYNwik8C/ykzJ2KKNK7VyD6Lh5h
 dP2uPU0aJ/wtGEqTCgAd8+XfN2HvgxXmZN8rVzqL3o/2FZ34UGbUlvUfnG9ji1YhZ5fZEq2zGAl
 OIhlYpSLne2ebzPK5hMI0yZqnuqD+tI18hGjvs3J5TCcpTq9cMecsZU66E0d7npChyvyN2qZssM
 aBRVx7YZ71Sn/krHoQTqCGyrGFvq8oeox/KtYsMvBGtYPocWPki4GclW54eqtwJGFWUzDif4JxI
 pab6E58bvrwnPKQqMmQ==
X-Authority-Analysis: v=2.4 cv=CZEFJbrl c=1 sm=1 tr=0 ts=698f6a0c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=P06-hBpE2ejTB6z5SqoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: HCw09IAz8v70-5YG1ppeoeqJBxU-F8sk
X-Proofpoint-ORIG-GUID: HCw09IAz8v70-5YG1ppeoeqJBxU-F8sk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130140
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33339-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,oss.qualcomm.com:dkim,0.0.0.47:email,0.0.0.2:email,0.0.0.0:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49E97138DA7
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 02:30:36PM +0530, Krishna Kurapati PSSNV wrote:
> On Wed, Feb 4, 2026 at 3:04 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 2/4/26 6:56 AM, Krishna Kurapati wrote:
> > >
> > >
> > > On 2/4/2026 7:03 AM, Dmitry Baryshkov wrote:
> > >> On Tue, Jan 27, 2026 at 10:53:46AM +0530, Swati Agarwal wrote:
> > >>> On Thu, Jan 22, 2026 at 4:02 PM Dmitry Baryshkov
> > >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >>>>
> > >>>> On Thu, Jan 22, 2026 at 02:58:52PM +0530, Swati Agarwal wrote:
> 
> [...]
> 
> > >>>>> +
> > >>>>>        edp0-connector {
> > >>>>>                compatible = "dp-connector";
> > >>>>>                label = "EDP0";
> > >>>>> @@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
> > >>>>>                enable-active-high;
> > >>>>>        };
> > >>>>>
> > >>>>> +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > >>>>> +             compatible = "regulator-fixed";
> > >>>>> +             regulator-name = "vbus_supply_1";
> > >>>>> +             gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
> > >>>>> +             regulator-min-microvolt = <5000000>;
> > >>>>> +             regulator-max-microvolt = <5000000>;
> > >>>>> +             regulator-boot-on;
> > >>>>> +             enable-active-high;
> > >>>>> +     };
> > >>>>> +
> > >>>>>        vmmc_sdc: regulator-vmmc-sdc {
> > >>>>>                compatible = "regulator-fixed";
> > >>>>>
> > >>>>> @@ -536,6 +585,39 @@ hd3ss3220_0_out_ep: endpoint {
> > >>>>>                        };
> > >>>>>                };
> > >>>>>        };
> > >>>>> +
> > >>>>> +     usb-typec@47 {
> > >>>>> +             compatible = "ti,hd3ss3220";
> > >>>>> +             reg = <0x47>;
> > >>>>> +
> > >>>>> +             interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
> > >>>>> +
> > >>>>> +             id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > >>>>> +
> > >>>>> +             pinctrl-0 = <&usb1_id>, <&usb1_intr>;
> > >>>>> +             pinctrl-names = "default";
> > >>>>> +
> > >>>>> +             ports {
> > >>>>> +                     #address-cells = <1>;
> > >>>>> +                     #size-cells = <0>;
> > >>>>> +
> > >>>>> +                     port@0 {
> > >>>>> +                             reg = <0>;
> > >>>>> +
> > >>>>> +                             hd3ss3220_1_in_ep: endpoint {
> > >>>>> +                                     remote-endpoint = <&usb1_con_ss_ep>;
> > >>>>> +                             };
> > >>>>> +                     };
> > >>>>> +
> > >>>>> +                     port@1 {
> > >>>>> +                             reg = <1>;
> > >>>>> +
> > >>>>> +                             hd3ss3220_1_out_ep: endpoint {
> > >>>>> +                             };
> > >>>>
> > >>>> Why is this port disconnected? It it really N/C?
> > >>>
> > >>> Hi Dmitry,
> > >>>
> > >>> Sorry for the confusion, Can we do it as follows:
> > >>>
> > >>> hub:                    Hd3ss3220   typec-connector
> > >>>
> > >>> usb_hub_2_1 <-> port@1       port@1 <-> empty
> > >>> usb_hub_3_1 <-> port@2       port@2 <-> <empty>
> > >>>                               port@0 <-> port@0
> > >>>
> > >>
> > >> You still missed the _why_. Why port@1 of HD3SS3220 is not connected?
> > >>
> > >
> > > There are no remote endpoints added in dwc3 node. Since we are making dr_mode host. Hence keeping this remore endpoint empty.
> >
> > So can you like.. add the endpoints under that node and problem
> > solved?
> >
> 
> > solved?
> >
> 
> The lines go from SoC to Hub directly and not the port controller. And
> hence can't connect remote endpoints of dwc3 controller to the hd3
> node.

A comment in the commit message (and/or in the DTSI) would be nice.

> 
> Regards,
> Krishna,

-- 
With best wishes
Dmitry

