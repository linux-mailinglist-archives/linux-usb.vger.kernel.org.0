Return-Path: <linux-usb+bounces-28234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D201B815B0
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 20:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2489A1C256F8
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 18:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9C62FF653;
	Wed, 17 Sep 2025 18:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DD0K6u4b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9932FF664
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 18:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758134189; cv=none; b=CLmmGtrdhe/uPxpsCM1+UQqO3q8AB8QU8yp9Ln8UCvrvbOiAJztkOIbDlbYgbZaaz5mnfkFsgKnSP3Y9vTawwr/8rsgvIoR6hELrz7jZkU0H5waamJKFJ/ZrW199+y4zOpPo2ltJuXnkqnE0qKzCQve8u3uneFFTbThMFZZP+JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758134189; c=relaxed/simple;
	bh=ShI2k9ivKU2ONLYeQn0ZPELa7RBfFm3UfEcjq3W58rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBiQHrdlRINEuz6jwj1BsD40px2U/jmP5G5cNomuwDiFYFPsTTZfcS8XFusakRor6Ma7Oy4csx+FOFhswDNKDXctVMGpQSeofjp9tExnwfdK9BQgy+6LyV1ALVNkxjSPSHgU52NHsWKRNAGZt2HFjdcA2zbSt1jnhjXCalL7Rhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DD0K6u4b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HCGSax009462
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 18:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6gNK6B9Z2A4lta5LSCT5cUXyJCQpIdZ/ubmiF5QefM=; b=DD0K6u4bwE+LyV2M
	9H63lfkUvnBZGktna6oM0D2qFtT/PWfNP0YPoDh3EdO59A4UKUHpBfPCxP+d32D+
	nzp+d36A9L1RUt5GBMJ4YyWdpi/SsVD8C5/0m9ykQWHKZf+Oq470ofpmBWT5CpTR
	EkQYUBLbWckRXnIyqRZNSzH9rGbH9S2HGOWKjCfXffczo6DP+QfqlZvXqGo21HVL
	0nFDebM5/z2b/ybIfiHu1t0jF7sLWmtRGiNOaHeQRGXhiIgeBq3h1XRaK1c3OV9i
	UR0xm8bRsnviE0nd0JRc7t39/eJXe3+eqRnBvLJgj409f6D/FWzLaSFB4RRQ1C+y
	dZI8fA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1uh7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 18:36:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b600d0a59bso678151cf.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 11:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758134185; x=1758738985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6gNK6B9Z2A4lta5LSCT5cUXyJCQpIdZ/ubmiF5QefM=;
        b=GvXX19T9cgSFigkCkvRdLImrdQ6xy8swO1+CxGEdIPo2vwa+VRUa5QeuxQ5KRAYXsQ
         NlBQ9BwSFjPh/mstxKsjPfOjKSPsxsFkxq8KNe69RqzIHoL0r56CfcldoThDbzf4cSnB
         6gdI0I6kjY4uVFlQjvm4AnkVlXSeN9R47htu+yGXKOektVlcvIzlHvbErZOHoNYAMPOw
         /fRyN4/o0+YQKDiv8d5Z9RkTnHnZKpPIw0Yz/xjko7TrtetGWZszVswJdrvlbUWrbtFN
         o0zDcFulAU5+LWabNFdKPn0YfB/PKZaZPuTRkx1DfiwmZLHIRA1fdWtoYstH+1uQbse3
         YmuA==
X-Forwarded-Encrypted: i=1; AJvYcCVzrDzYyEL2Rj/zs0/WyioQyRTI9hRwFMH4xg28yYCNphBdQGNRz3Cr+hIVytg6Yxv5Zq0WEVUFA5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsaOBLtBYJCPlItwgbr2fUtPFZjtL6i3PvQhwKz8ZFQb1lzoV3
	ica8CzZOzZThrQxlUOfn3TNWEGCzLY10tVrFsQvwdw3YlndpTN2nVDJ5f+Jsmqlk+05EO9V/T78
	8chjLJOhoqy2MPMoWDuEfGewBwDcL7WbSdoH3kYEGHWf7RMqcXENOVWIf5yU+1iQ=
X-Gm-Gg: ASbGncvhbH12mTXUmOYJhZ6cgWbcdxczaFojJZrND4UvTFaRFZsP3GZLEMJ8kU5JW36
	IJ4b5zteVHVi4REzBzEIKw+yHyAHjsG7e/wfD2lPW7Lb3rvKg4UrRhJF5hFJfrHYc0Vgtgfr05c
	acoTHTjMjJeBM+JJNdLGPa+0TeVN0Q3KkDNJFZNxSqVACZ3FCvEzHVan43lp51hkn1k6bDiJvoq
	dvM1ihREY8NwziftHr61Zuuc9/qHx9EHlEsEMGScaK8jK1isZgTjt/ylXRQmCEYdSWTNuP5U2sc
	mVP4TrMo3SenQ3SpliG+qYhkpJ16JJhbkB+0WkLZWSqgaBANROpttzLx+wwJ/CPZj043kqAQhfI
	NXRgUEkcihR9Fn6UsBKLlog==
X-Received: by 2002:a05:622a:109:b0:4b7:8076:a18b with SMTP id d75a77b69052e-4ba6c1e8f28mr25265811cf.12.1758134184557;
        Wed, 17 Sep 2025 11:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLuRNGN9aEBJZ8GryG0uthn3tSIvqT4mf7CdTs+y8S8l0MhVt4Qree4ToiBP0C/0e4uJiEYA==
X-Received: by 2002:a05:622a:109:b0:4b7:8076:a18b with SMTP id d75a77b69052e-4ba6c1e8f28mr25265241cf.12.1758134183687;
        Wed, 17 Sep 2025 11:36:23 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5f4156esm59054a12.46.2025.09.17.11.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 11:36:23 -0700 (PDT)
Message-ID: <e648a71f-a642-4f5d-bcf8-893484cfe601@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 20:36:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] dt-bindings: thunderbolt: Add Qualcomm USB4 Host
 Router
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
References: <20250916-topic-qcom_usb4_bindings-v1-1-943ecb2c0fa7@oss.qualcomm.com>
 <20250917061236.GF2912318@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250917061236.GF2912318@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t2I4AH2Ofosf8VowcQCoS9viXqUB4eY3
X-Proofpoint-ORIG-GUID: t2I4AH2Ofosf8VowcQCoS9viXqUB4eY3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX6MyBybPmB0/c
 USuvLU8Sx5u94ENLcgjUfjH7kyo0EvgDXr3ufi1RWYfFDZGUZO5uj8On2aI/c05J8/9tmXjPfrC
 YDry0tEVpeVkz4ib3GPaCy9JZox8Cgr6vwzexEFw7Md2WKe+EyLbQ9dpCVhT57jnchWzbQdntwd
 Xmfa8ULbHLG0pgySNB1ZaTFYZx4wPk9MsDe2ZieDS7Lb3KW8Oec8X9l0NVBknUG5wo0SseUYhCt
 dYm1gfmIXnQrBoq+fw7dusQqb7DdGRyDCQrDzHIOnW2s+E4geSZ8MpSIsEcoHt/ub/chXovXdSm
 o+y3Pq2qYZ3ozi2cMBfETO8eXwrYbHar3m8QzZiji22LR7BBK28hn54/f2GZ6Ob1Fe3e+mRxT3s
 wNEJIvJ0
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68caffa9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=yMhMjlubAAAA:8 a=EUspDBNiAAAA:8
 a=6jotvRMCQIAsDOHH8VAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 8:12 AM, Mika Westerberg wrote:
> Hi Konrad,
> 
> On Tue, Sep 16, 2025 at 10:06:01PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]

>> P.S.
>> The driver part (which has quite some dependencies) is not yet 100%
>> ready to share and will be published at a later date.
> 
> Okay, I think it is beter to submit the bindings with the driver changes so
> that we can see the big picture.

We're not going to do that just yet, but I'll give you the gist of it
(partially also responding to Dmitry's other reply to this email):

- The current thunderbolt implementation is almost entirely reused

- Our HR is MMIO-mapped and always present (i.e. it's not a PCIe device).
  Since the NHI code already uses I/O accessors, we simply ioremap() the
  NHI region and feed the existing code the __iomem ptr (really cool)

- Because it's not a PCIe device, all the places where the code assumes
  it can freehand dereference nhi->pdev are altered to instead consume
  a struct device *, i.e.:

diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 75247486616b..d05f8d6896e7 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -493,22 +493,37 @@ static inline struct tb_xdomain *tb_service_parent(struct tb_service *svc)
  *                 MSI-X is used.
  * @hop_count: Number of rings (end point hops) supported by NHI.
  * @quirks: NHI specific quirks if any
+ * @is_pci: Whether the NHI is a PCI device
  */
 struct tb_nhi {
        spinlock_t lock;
-       struct pci_dev *pdev;
+       struct device *dev;
        const struct tb_nhi_ops *ops;
        void __iomem *iobase;
        struct tb_ring **tx_rings;
        struct tb_ring **rx_rings;
-       struct ida msix_ida;
        bool going_away;
        bool iommu_dma_protection;
        struct work_struct interrupt_work;
        u32 hop_count;
        unsigned long quirks;
+       bool is_pcie;
 };
 
+struct tb_nhi_pci {
+       struct pci_dev *pdev;
+       struct ida msix_ida;
+       struct tb_nhi nhi;
+};
+
+static inline struct tb_nhi_pci *nhi_to_pci(struct tb_nhi *nhi)
+{
+       if (WARN_ON(!nhi->is_pcie))
+               return NULL;
+
+       return container_of(nhi, struct tb_nhi_pci, nhi);
+}

I suppose I can probably get this decoupling sent in advance of the rest..
It's quite delicate so I'm hoping I won't cause any random nullptrs for you


- Additional steps are necessary to take the hardware out of reset, set
  some magic values here and there, load the firmware (i.e. memcpy_toio())
  wake up the MCU and perform Type-C magic (more on that below), all of
  which is handled in a new qcom_usb4.c, which does that and ends its probe
  function with a nhi_probe_common(). PM of the hardware and its providers
  also takes place in Linux, just like with any other IP block on embedded
  systems


- Because the Type-C pipeline varies wildly across Qualcomm SoCs and even
  devices using the same SoC, we need to register a typec_mux to receive
  generic (alt)mode notifications. The is more or less:

pmic_glink_altmode/ucsi (altmode notification provider)
|-> QMPPHY (Qualcomm proprietary USB4/TBT3/USB3/DP mode switchable PHY)
  |-> (optionally) Onboard switch (e.g. FSA4480)
    |-> (optionally) Onboard retimer (e.g. Parade PS883x)
      |-> USB4 HR (pinging the MCU with some mode/cable info)

The actual entry logic (sanity checking, magic VDMs, SOP/'/'' comms)
happen on a remote processor - Audio DSP (yes) in the case of X1E and
the OS is graciously presented with a trimmed-down notification that
the altmode has been entered and it better cooperate

[...]

>> +  reg-names:
>> +    items:
>> +      - const: router
>> +      - const: router_config
>> +      - const: tmu_config
>> +      - const: port_group
>> +      - const: sideband
>> +      - const: uc_ram
>> +      - const: uc_per
>> +      - const: uc_mbox
>> +      - const: nhi
>> +      - const: cfg
>> +      - const: debug
>> +      - const: usbap_config
>> +      - const: pcieap_config
>> +      - const: dpap0_aux
>> +      - const: dpap0_config
>> +      - const: dpap1_aux
>> +      - const: dpap1_config
> 
> Are these the specific to the host controller? I mean route_config sounds
> pretty much like Router Config space and that is available through the USB4
> fabric so not sure why this is listed?
> 
> Also this does not list the standard Host Interface registers, is that on
> purpose?

The 'nhi' region contains the entire spec-standardized set of registers,
everything else is qc-specific. The host router has internal connections
to the native protocol controllers, so the XXXap_config regions include some
tunables related to that.

The uc_ regions relate to the block's MCU.

router/router_config refer to top-level tunables or control/state registers.

tmu_config is the same, for the internal timing management unit.

debug/cfg are self-explanatory

Most of those will be left unused, but the binding has to be forward
looking, in case some sort of a software workaround is required down
the line

> 
>> +
>> +  interrupts:
>> +    items:
>> +      - description: Combined event interrupt for all three rings
>> +      - description: OOB Firmware interrupt
> 
> No MSI? If not then at least I suggest to support it in the DT description.

No, it seems like across the SoC we only have MSIs on the PCIe RCs

Because I don't know what a valid MSI setup would look like, I'd like
to defer adding that description to when a platform with them pops up

[...]

>> +  wakeup-source: true
> 
> What about the "power contract"? Are you using the existing we have for
> ACPI:
> 
> https://learn.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#map-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers
> 
> It was designed DT in mind but I don't think we have DT bindings for it.
> This is needed to make sure the driver (Connection Manager) creates the
> tunnels before the native protocol stacks get enumerated (e.g during power
> transitions).

I added a custom entry to drivers/of/property.c, matching that name.
Seems to work fine (tm) so far, but then we haven't yet tested sus/res
much.. 

Just to make sure - are we expected to ensure that the NHI device is
resumed before any protocol controller drivers (at runtime), or do the
latter have to *probe* only after they're necessary? I firmly believe
the former, but doesn't hurt to ask..

[...]
>> +            port {
>> +                usb4_0_mode_in: endpoint {
>> +                };
> 
> This describes the Downstream Facing Port (e.g USB4 port), right? We have
> something similar used in Chromebooks so it would be good if we can make
> the bindings close to each other if possible. This allows binding firmware
> description to retimers (and also to "fixed/embedded" device routers as
> recent changes to the USB4 spec makes possible).
> 
> See drivers/thunderbolt/acpi.c::tb_acpi_find_companion().

Yes, this binding assumes the Host Router has precisely 1 DFP (Linux
Type-C infra isn't ready for anything more, at least not on the DT side
to my knowledge) and this port (which isn't necessarily the same as a
connector, i.e. a physical receptacle in DT speak, it simply refers to
an abstract data connection between two devices)

Notably, I don't think we currently describe the USB4 port (as in, the
usb4_port.c meaning of it) at all, but for on-SoC HRs we know all about
them, so perhaps a subnode description could make sense. This way we
could also point them to the compatible = "usb-c-connector" node

Konrad

