Return-Path: <linux-usb+bounces-28266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6511B83AFA
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 11:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A4624A66AD
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 09:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1812FE564;
	Thu, 18 Sep 2025 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iasrYwn/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F302F8BF4
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758186351; cv=none; b=qrwOUKxnT5m20nspGKYv8QMvrcbbsRoIsoFGo3DE1yTrqApV69ZXwh5KlDu6VjIqecKUCFLth45JzGfVfMe7jSNrxbzjD5MRtr/9S8jBczqZu7Q0yXdxoJzYefhyzL2/DKnjelAYE1Ypw+UiWduT+G1k/2d/YkrOpzoFozrjozY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758186351; c=relaxed/simple;
	bh=3jNolqJkapC/Ko3tIVGHtQ6koTpXkWQZS6HoZP9KJ3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsX8KoC6ma5spIjcrNPcKB/KylgGp46+l5rGq9/dgd1OC0AwjGTbVfK6sR0aGG8IFkjqJiGhUrzSdk3iHAomxfEsoaTyu/ZU+s8Wy4RX6wDbKTIZolqQw6Ly7zoPrSarOtbGUU8gu5mCZlOBxUEL4Ev/OwSyrW0jKHrKv63c3bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iasrYwn/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I37A6l026833
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 09:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	efwfuR0XZuIlYyd3jHeDV9GXnA+hdIP5wvjI/VjJjUc=; b=iasrYwn/9pH8hb8G
	GQWuNQoQqOP+gTGpFNe+OrrORZJb/JnVA5//h2oL/HI6l7PBAXj6MupId/BycE8L
	WWq3eCzQGm1t4/MqsNbYmtG00kp7m9YZoWRmYgruE6ZeMkFHGsj/7Y23vr2JOxDJ
	1QxQhSiXaUvqxc953YkjJbmr2zCqxUZOa0bysKsXqjm5cywbG9NVY12t2ame+qfp
	kAisG1Fv2FCoW4oIeWf7Vd+jpzcEUB5c2OCJAtVN/m5gdaFOUVrFyDqk3wpskgNF
	M1z73/iupTXGViwl6eLLDyNDd2KoYrqhW520JIGhH5c8vyc0xNifME75mS9Pg71N
	t2dX3Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt5prg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 09:05:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-780e20b83b3so2680536d6.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 02:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758186347; x=1758791147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efwfuR0XZuIlYyd3jHeDV9GXnA+hdIP5wvjI/VjJjUc=;
        b=hoM7fCl8lkXwGu4WK/is/B+lee9zDwxvmA1Clc8VA4BgWJTH0a+ZjrTGI3E+NEhSgg
         YHuYE9CxwaWTuUcX2imIg1K8eFqiMEgrS/vpwO+ov56MEH83zMCO90GaFpK9YU0Qt9gp
         S1Du4z0SaDQFgSSmmpPL30/IXGcSTyDomxjBBkxMbEb2QBt1Tv+h84T+KwBCRkq2Ncvi
         ZPxosohSuXOCTtsnnyVsoMP07gcNQc8laiXvBo3dPE+AbAmPe5PCkWkoVUqbnKJMeDtT
         JRXajaH2jyzeUk4u/YLFeBqK1FK9XNN2qRJQYUx5Rpd9MOcRBoF/Lnus+8BNVmqUGECO
         Z/bg==
X-Forwarded-Encrypted: i=1; AJvYcCXQzL3O2XY9k96qquln0K1VOqr1AMy5Im92f9hJ2mrAjhuezHtmxNIdGA1lNY6z+DVjW+niw9yBOnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/CerLXcVSaTfampOSCF2dedFsav7lPdi551kmqTE/HjEFY5fL
	RJgwqtdAAw1KEGoV+2JnYgAyE921JY+TYz50ZvmIM6XNb0eKcZyrtgWS/EiMDQ2prg2Mjewp1FZ
	ZFf72DDpZAPQhpPlbKrtSWXiLvBeMGpUd9AvffI+SaMaG09o5JiG31CVYFReBjyXvOkT0btM=
X-Gm-Gg: ASbGnctkCRPFEQ2YSC/sO33Ei/SH4ooUhS/UiDuPkIN1LhV02kGYpxkrR6njor0oOUe
	qcMFGiZXFJ2Gz2Uomtbco6D3jS6i7AJzUu9ETPMhFlYEuusGHUzzvIplW/m9v9mauhgKDu+VHKk
	BQE3CwljYNTJhr3lNrWCDg9LUPIhX8p6gp2qdCKchjr/xXQxgHZAqFP3WmZ+TNJ7CCvS0XrMONW
	Un1wSG16Kv5PQn+scezH7uR3LaEkgNxE+1KnIEUieXV6M44OoJg9ORjAhNMdWAPbe8RjdeNmIOb
	AHWeHvIDEiuhgWAuWaQwikklVeLrsY5ANKLTf4/9uyd0kRY/dbWgASDi3zDVsClGM1iiJtIkUv4
	JDQZS8vVmhrdEJMdrEOgV2Q==
X-Received: by 2002:ad4:5c4e:0:b0:773:84c1:396 with SMTP id 6a1803df08f44-78ecc822080mr35313206d6.1.1758186346563;
        Thu, 18 Sep 2025 02:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFbRLbBIv3u5UrETuMfbcXFVbaueQuIikLkfQf7q3WwNCyZ+rot/De/umJEGNwkT7guFXU/w==
X-Received: by 2002:ad4:5c4e:0:b0:773:84c1:396 with SMTP id 6a1803df08f44-78ecc822080mr35312996d6.1.1758186345967;
        Thu, 18 Sep 2025 02:05:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5f287d9sm1085733a12.44.2025.09.18.02.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 02:05:45 -0700 (PDT)
Message-ID: <035c0d66-bddd-495c-bd23-e1d98570ba7f@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 11:05:42 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] dt-bindings: thunderbolt: Add Qualcomm USB4 Host
 Router
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
 <e648a71f-a642-4f5d-bcf8-893484cfe601@oss.qualcomm.com>
 <20250918051244.GJ2912318@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250918051244.GJ2912318@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZuIAT0Mb-G6dOUE4FDr367k2DB4GPylQ
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cbcb6c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=yMhMjlubAAAA:8 a=EUspDBNiAAAA:8
 a=Nf3ZQrY7d6tcd-rdNfQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX6bwz/1HbmgLR
 Z4imdx/MoTb274r9z0jelS5/tsi4rtD3daI4XVPjSDLnf5k5pOh5Qm4p1mL75jZLIUet5a1pPTP
 Xnn04JvOwZIPrNuwhiv/DN+vdmOV57r7Y0FB8+oWrPl4iT/wpOo8f8X/nSssA8y+htoPrgl1XTD
 YiuCXkb1k2yHbR1h1thuqL6l2eVCgeK+uMim+CKBwr+niouaP4XxU6Xmj2TpCtELnQO2xz7zLRB
 BWzUXoqaSImc/F6pxDDKqWFy6yaB4znVLUzlVDuvT6rc/wFrNshHcJjXjXQr+4/3cTzjpP4aNez
 PdVfZWyCqjiq8CHCN1FrbDpkpm3kv+2B9LWgvm342Dpbn7hqXNrac8WqOinFyNNxANm+Ze+pa0O
 69SY5F+y
X-Proofpoint-ORIG-GUID: ZuIAT0Mb-G6dOUE4FDr367k2DB4GPylQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/18/25 7:12 AM, Mika Westerberg wrote:
> Hi,
> 
> On Wed, Sep 17, 2025 at 08:36:19PM +0200, Konrad Dybcio wrote:
>> On 9/17/25 8:12 AM, Mika Westerberg wrote:
>>> Hi Konrad,
>>>
>>> On Tue, Sep 16, 2025 at 10:06:01PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]

>>  struct tb_nhi {
>>         spinlock_t lock;
>> -       struct pci_dev *pdev;
>> +       struct device *dev;
>>         const struct tb_nhi_ops *ops;
>>         void __iomem *iobase;
>>         struct tb_ring **tx_rings;
>>         struct tb_ring **rx_rings;
>> -       struct ida msix_ida;
>>         bool going_away;
>>         bool iommu_dma_protection;
>>         struct work_struct interrupt_work;
>>         u32 hop_count;
>>         unsigned long quirks;
>> +       bool is_pcie;
>>  };
>>  
>> +struct tb_nhi_pci {
>> +       struct pci_dev *pdev;
>> +       struct ida msix_ida;
>> +       struct tb_nhi nhi;
>> +};
>> +
>> +static inline struct tb_nhi_pci *nhi_to_pci(struct tb_nhi *nhi)
>> +{
>> +       if (WARN_ON(!nhi->is_pcie))
>> +               return NULL;
>> +
>> +       return container_of(nhi, struct tb_nhi_pci, nhi);
>> +}
>>
>> I suppose I can probably get this decoupling sent in advance of the rest..
>> It's quite delicate so I'm hoping I won't cause any random nullptrs for you
> 
> Instead of the above is_pcie thing, can you split it so that the PCI parts
> live in pci.c and the "platform" parts live in platform.c (or perhaps this
> is fauxbus now). Then the core part of the NHI code (nhi.c) just works
> regardless of how the controller is wired to the SoC.

I'll simply try to get this decoupling sent soon, so we can debate
over material changes

> There are plenty of examples in the kernel how to do this.
> 
>> - Additional steps are necessary to take the hardware out of reset, set
>>   some magic values here and there, load the firmware (i.e. memcpy_toio())
>>   wake up the MCU and perform Type-C magic (more on that below), all of
>>   which is handled in a new qcom_usb4.c, which does that and ends its probe
>>   function with a nhi_probe_common(). PM of the hardware and its providers
>>   also takes place in Linux, just like with any other IP block on embedded
>>   systems
> 
> Call it qcom.c. But please try to move all the non-PCI generic parts into
> platform.c and then only the Qualcomm specific things live in qcom.c. Idea
> is that we can re-use all that when for example Apple Silicon support is
> added and so on.

That's the plan

[...]

>>>> +
>>>> +  interrupts:
>>>> +    items:
>>>> +      - description: Combined event interrupt for all three rings
>>>> +      - description: OOB Firmware interrupt
>>>
>>> No MSI? If not then at least I suggest to support it in the DT description.
>>
>> No, it seems like across the SoC we only have MSIs on the PCIe RCs
>>
>> Because I don't know what a valid MSI setup would look like, I'd like
>> to defer adding that description to when a platform with them pops up
> 
> I it hard to change these DT bindings later on? If yes then I would
> definitely think forward and make this support MSI from the get-go.

dt-bindings (attempt to) promise an ABI-like interface, so bindings
for *a given IP block* ("dt-bindings describe the hardware") should
not change, unless there's something critically wrong (e.g. "this
could have never really worked").

Adding new properties is always OK, marking the new properties  as
'required' is not (unless it falls into the aforementioned case).

It's also totally OK to add MSI properties to e.g. Apple Host Router
bindings specifically when they come around, as it's simply a different
piece of hardware. It's also OK to create a usb4-host-router.yaml down
the line, which will act as a common include and perform any
maintenance/code churn, so long as it doesn't end up in the bindings
for any specific hw block (e.g. this QC one) becoming more strict
than they were on HEAD^.


> 
>> [...]
>>
>>>> +  wakeup-source: true
>>>
>>> What about the "power contract"? Are you using the existing we have for
>>> ACPI:
>>>
>>> https://learn.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#map-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers
>>>
>>> It was designed DT in mind but I don't think we have DT bindings for it.
>>> This is needed to make sure the driver (Connection Manager) creates the
>>> tunnels before the native protocol stacks get enumerated (e.g during power
>>> transitions).
>>
>> I added a custom entry to drivers/of/property.c, matching that name.
>> Seems to work fine (tm) so far, but then we haven't yet tested sus/res
>> much.. 
>>
>> Just to make sure - are we expected to ensure that the NHI device is
>> resumed before any protocol controller drivers (at runtime), or do the
>> latter have to *probe* only after they're necessary? I firmly believe
>> the former, but doesn't hurt to ask..
> 
> The former. The TB driver needs to setup tunnels before native protocol
> stacks and their drivers (e.g PCIe and the like) resume. We have the
> device_link from the native "port" / device to the NHI that deals with it
> but it expects the property to be there.

OK then we're on the same page, good

> 
>> [...]
>>>> +            port {
>>>> +                usb4_0_mode_in: endpoint {
>>>> +                };
>>>
>>> This describes the Downstream Facing Port (e.g USB4 port), right? We have
>>> something similar used in Chromebooks so it would be good if we can make
>>> the bindings close to each other if possible. This allows binding firmware
>>> description to retimers (and also to "fixed/embedded" device routers as
>>> recent changes to the USB4 spec makes possible).
>>>
>>> See drivers/thunderbolt/acpi.c::tb_acpi_find_companion().
>>
>> Yes, this binding assumes the Host Router has precisely 1 DFP (Linux
>> Type-C infra isn't ready for anything more, at least not on the DT side
>> to my knowledge) and this port (which isn't necessarily the same as a
>> connector, i.e. a physical receptacle in DT speak, it simply refers to
>> an abstract data connection between two devices)
> 
> Okay I'm not too familiar with the current DT bindings.
> 
>> Notably, I don't think we currently describe the USB4 port (as in, the
>> usb4_port.c meaning of it) at all, but for on-SoC HRs we know all about
>> them, so perhaps a subnode description could make sense. This way we
>> could also point them to the compatible = "usb-c-connector" node
> 
> It should be something (eventually at least :-)) that allows us to describe the
> USB4 ports and on-board retimers (to make it possible to upgrade firmwares
> on those even if there is no link). But also if there is "embedded link"
> device router.

FWIW on DT platforms, onboard retimers (such as the PS883x) are often
described as children of the I2C bus (see e.g. "parade,ps8830" in:
arch/arm64/boot/dts/qcom/x1-crd.dtsi), marked as 'retimer-switch',
which then typec_retimer_xxx() APIs look for using of/fwnode_graph.

Because they're not opaque, but rather self-contained platform
devices, FW updates can/will happen without the tbt subsystem in the
picture.

That said, the retimer being TBT-compliant, still shows up in the
topology:
thunderbolt 1-0:2.1: new retimer found, vendor=0x1da0 device=0x8830


I think adding description of a usb4 port should be quite simple,
I'll look into that.

Konrad

