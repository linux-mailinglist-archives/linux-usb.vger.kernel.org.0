Return-Path: <linux-usb+bounces-37234-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL+0I7OfAWpKgwEAu9opvQ
	(envelope-from <linux-usb+bounces-37234-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 11:21:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD150ACA3
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 11:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC34F3054FC5
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C673D3BED7A;
	Mon, 11 May 2026 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/AJSInK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHXJ1NpV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64453BED32
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490424; cv=none; b=g5mEHRq/H5SliIsU7ZzmnyYSYL1ORUNHLq4qdI1+lwfgrqxX9sjJZ55biIFIHyQZhUjIZwKGNoRcUwoh6+srDZKUqsljIibK93943MCSSp8+6jj+PyGM4U6VZGRcPo2n4pOjoFWPEwkucmWMAnr2KYUzfetEXP9dqpsJt0e78HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490424; c=relaxed/simple;
	bh=WxpBNfJwvmWf/X8SMKzFtqemEXiKEhA670DZ/lKOrlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJDwXWCUvZOP5JtzsxrwbIrd9V3pYaOYan0qhRsoKFHq/gW9i4XKHO+mUXoxiDb1/0bEokN5Ivnn/+VjTGbM+Q3PEBsEThGiYngxzBGCf+f3FxEafna3y6DKyX3eyduul0In266bVUFzdP+7s+67/FP3rUvqHpZe/kT1H67yYfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/AJSInK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHXJ1NpV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7FKUv3332700
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 09:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dLsW9rT+luAiGwnM3aLn85XIH1sYKUrmCAMhbyPlETo=; b=U/AJSInKydM44Aas
	1TvJzUJnk9VLCdyeofAtdvL6fJEppprBv8LQtbyapn1+QY45cYFGDvnQU6lLnUTm
	jPfOwbm28dHZ9HnGa06QQbxSGb1Aev2kaIPA9Sda85TEp35pO/Aq7FAPEKF3Q6vr
	jBLQ0bbLkliUhuk7s2E+BikEKhIxY/m7hkcskPOZmSIcBthbzidXMG8HNLX+vj8w
	59k0Yu82SPpJx6fHhbFPcsg5OLwo7Om3x55IeTiymtVmCqBPFwK8innah+1Rbo82
	FruJjC7arnUjhdm5ZWpjsHMAxqB05jHgu/GJLRHSl/NJ794EpTafak9pvX2PYgCM
	G5Hj3g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgrdpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 09:07:00 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5751990b248so357851e0c.2
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778490420; x=1779095220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dLsW9rT+luAiGwnM3aLn85XIH1sYKUrmCAMhbyPlETo=;
        b=WHXJ1NpV35t6f2zaLi4QHgO+BU2+Suo15iynnIfpUe1lzGnyVi5j1Nyz+m9plPCrHe
         Z/8OYyjrG/hiZ1iH3U46tiDF8P5Z5MBmslthbX7JnUqL21uwBA6IFVPVrkBuWKmeC40K
         OlywFqyj1+/7lCL0JaZb6ZL/4641fEVYA+RfejhFMfuResshopqEpjpJJoRKYY97OTIn
         5KsUp98fMfS4JdG8rbVXRhNOGuqACwPCSqBBTf+9jxTXadF8wevv70TZHM4YnNj5pCOp
         4Piwv4phmbiogJ1GzkgdxHgNfAyYKZ74bmCQJ61jIyfYItuV/y2O5NCvclGsgGXFxgn4
         PsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490420; x=1779095220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLsW9rT+luAiGwnM3aLn85XIH1sYKUrmCAMhbyPlETo=;
        b=szVoeczVYxQ8ewfWXrq/Bzc+I2JE9M4xgId/BsRBKN1AJwJWIYNQIdxcok14goPsaJ
         XZ5IEWUPV7JZdbqIf3KcmKdX4k2e/fWIHnOLll0oPmU4Fa22b5oxR/msOI2FvInYZ3CE
         3A1ScYdFXZDq35ijDEBRRTDCs7JfEgOJQqqkg6ofJkqBTxmjUQL8TBOmkkx+/xhoG9KN
         VHbpy9EjecQ5C6MjsDnLL1yX+hEAhs35z4F2hinyVkjdZSMR33TzF5MbOClqjag4fUqN
         8T621FY0kBVy5Xq4RaRPdf0mM9NgUwTAmnDsgGGt9NAFwQPdND5GvtSNWCSMDdxcTLTG
         NuJw==
X-Forwarded-Encrypted: i=1; AFNElJ9E87c8+Fujm3BQWnTEBVNf36Oq0es24I2UJ/7NiTYmlEccuXX2ff3ALnrBee1bRS74pu+wP63RN/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YytG3XU9XlMy8/RH+3jAttcgBiT6GINSxsA9r5RMsYpI246MJll
	EIxByiaSW96kdGcTOSfVl0qpwwu0+okuB/jhHCDeVvjMDaAWXnHznnm15Du5mr2BoYqyVkehj3V
	knKkUigbC4ymDnZQ32s3X77Yq7RQM7sX7hciD8733NGOg2tc3Awd+Xc98qomGsvQ=
X-Gm-Gg: Acq92OF7IYa4z0oICoF1vITPhEnjr8smecaPwAIXdmm4ihpfY2STOMxIWuGgI7h08tT
	E2kx0Jsl+Xxk1yrsAgenDzHK7wOZp4qElp6Ly/nvxg2PHHWQE6soplzKM/GA85HfCm2dhKVP4S+
	3R1Y4E4+/gosc5kQkhnLfRs31lrmB45egFstTE0C9sYMRXG6VJW5E116n7ZtAKajESdnzguYwUs
	EpSdvCo5ywWe/OXknXXflQbuVmuVa607LyGFrKj3vp47ByE/HjprXkqArlr70EaWoo9rSNc0zWq
	ia5dDhZT7Nz7ToRtPV1WLtXLXSgkX7AxG5LeY9HFgj4hU3/32xd8jB4fXeDAJaZj5rWYIBitlSV
	LCRRSI5ggHYhDP11OZ3Az9wUA+gz1dFa9LuXODeRnnW86bvWsjhlOWvmqbRwbqYyu/mr3P52gW4
	LmTww=
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1443218137.8.1778490419849;
        Mon, 11 May 2026 02:06:59 -0700 (PDT)
X-Received: by 2002:a05:6102:31b5:b0:631:437d:be97 with SMTP id ada2fe7eead31-631437dbf33mr1443215137.8.1778490419473;
        Mon, 11 May 2026 02:06:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcd18884a3bsm261121366b.30.2026.05.11.02.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:06:58 -0700 (PDT)
Message-ID: <0431f8ff-545b-4533-8bb3-d4f3d2e30032@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:06:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Sven Peter <sven@kernel.org>
Cc: Jack Pham <jack.pham@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
 <afpyvhadqZw0xfTB@vbox>
 <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
 <afzP+uoUALSji95Q@hu-jackp-lv.qualcomm.com> <af0SM3C5qHc73DM8@vbox>
 <670f9a9f-54b9-4109-986e-5071caf1dcaf@oss.qualcomm.com>
 <af5sfCOfBa7mYqPw@vbox>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <af5sfCOfBa7mYqPw@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a019c34 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NhS5FUBgDc7y_bOL5IQA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: XoUqm6u-x2CypYAWLacarMKYIvrBipWD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwMCBTYWx0ZWRfX+LGN3PykQ3/6
 xxwadtDGJ42FXxZKosr3CwuGwyvaxZflxB1M/6rmlkgcRqU4JD2J4CKY1mNbc+fQPSWAV6K/N7O
 iicqQTtiieSegN0748rwTyxUpAkYfVE9zPDZfQOzOfqZPbkMSFXL/CtfC0uI19kTn9ZYOR6cdS3
 sOuTlMB9j32SOThdQoPtpna3ZpINucmykxhcliEodY6WdEkYvYxv9o35AMbcNSW6r8nz2SQWAna
 /SoJudozb8xEKKgS50Pf2wlYOlkAPEXhqjcHlLzToM34v/oQ5LX5nXQRjX+1SnHHrpyfkjpHyzW
 e6FagaGKGvMSwNLdIRR2x5FXSyKIIyiDv0gXkrn9Od2wNnRi1MqgmIkmWVwVQruyeB6NHp5ISWG
 CIE5D0V7OW2XE0AHNNnUAkvtq0T5FEvn50MOWCGT+KVyDS0v8MIwPjQuebH0FwEtUJTnqZcsgAB
 0UJPtKWp8DWLvSc5r4w==
X-Proofpoint-ORIG-GUID: XoUqm6u-x2CypYAWLacarMKYIvrBipWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110100
X-Rspamd-Queue-Id: 0ACD150ACA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37234-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/9/26 1:31 AM, Thinh Nguyen wrote:
> On Fri, May 08, 2026, Konrad Dybcio wrote:
>> On 5/8/26 12:46 AM, Thinh Nguyen wrote:
>>> On Thu, May 07, 2026, Jack Pham wrote:
>>>> On Thu, May 07, 2026 at 12:34:50PM +0200, Konrad Dybcio wrote:
>>>>> On 5/7/26 1:40 AM, Thinh Nguyen wrote:
>>>>>> On Tue, May 05, 2026, Konrad Dybcio wrote:
>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>
>>>>>>> The Thunderbolt framework relies on the USB core to create device links
>>>>>>> for tunneled ports, so that the USB3 controller is only kept
>>>>>>> runtime-resumed for the duration of the tunneling. This depends on
>>>>>>> first knowing whether a connection is tunneled or native.
>>>>>>>
>>>>>>> Add the logic to handle that for DWC3 controllers.
>>>>>>>
>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>>>>>>>  drivers/usb/dwc3/core.h | 18 ++++++++++++++++++
>>>>>>>  drivers/usb/dwc3/host.c | 12 ++++++++++++
>>>>>>>  3 files changed, 42 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>>>>> index 65213896de99..7cec4911e278 100644
>>>>>>> --- a/drivers/usb/dwc3/core.c
>>>>>>> +++ b/drivers/usb/dwc3/core.c
>>>>>>> @@ -162,6 +162,18 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
>>>>>>>  }
>>>>>>>  EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
>>>>>>>  
>>>>>>> +enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port)
>>>>>>> +{
>>>>>>> +	/* Prior versions had no CIO support */
>>>>>>> +	if (!DWC3_VER_IS_WITHIN(DWC31, 191A, ANY))
>>>>>>> +		return USB_LINK_NATIVE;
>>>>>>> +
>>>>>>> +	if (dwc3_readl(dwc, DWC3_CIOCTRL(port)) & DWC3_CIOCTRL_CIO_EN)
>>>>>>
>>>>>> The CIO register block only exists if DWC1_USB31_EN_CIO is set (and
>>>>>> DWC_USB31_EN_USB2_ONLY is not set). In most cases, this register block
>>>>>> will be reserved, register read of reserved block should be 0. But we
>>>>>> can't guarantee that it will always be the case.
>>>>>
>>>>> That's inconvenient because..
>>>>>
>>>>> [...]
>>>>>
>>>>>> We shouldn't need to be doing this. This should be checked from the
>>>>>> xHCI driver. Check xHCI spec for PORTSC.TM and USB3 tunneling support
>>>>>> capability (section 7.11).
>>>>>
>>>>> ..I'm seeing only caps 0/1/2 (and 10 on some but not all) advertised
>>>>> (I ran a for-loop checking offsets 0..=255)
>>>>
>>>> Right.  That section in xHCI spec was only added in the 1.2b revision.
>>>> However the DWC31 IP versions that current Qualcomm USB4-capable SoCs
>>>> are using are 2.00a (and a customized version of 1.91a) which are only
>>>> compliant to xHCI 1.1 so this capability is not there, even though the
>>>> CIO register block exists.  So short of having the proper XHCI bit, this
>>>> is the next best, non-SoC specific alternative we've found that can
>>>> allow XHCI driver to identify when it is operating in tunnel mode.
>>>>
>>>
>>> I see. If you're using 2.00a, then we can't use the xHCI's capability
>>> register and PORTSC.TM.
>>>
>>> Can we match the compatible string to check for CIO capability and have
>>> this passed from your glue driver before accessing the CIO registers?
>>
>> Hm, we currently use a shared compatible string for the USB3+4 (1.91a-xxx)
>> and USB2 (3.30a) hosts on the USB4-capable platforms..
> 
> Ok.
> 
>>
>> Another idea would be to bail out if
>>
>> !device_property_present(dev, "usb4-host-interface")
>>
>> which would place the burden of making sure the DT makes sense on the
>> programmer (which is OK in my view)
>>
> 
> For the DWC3_CIOCTRL_CIO_EN to be set, it needs to be done by the type-c
> driver after detecting alternate mode right? How is it being done now?
> Can the udev->tunnel_mode be updated directly by your type-c driver
> when it sets DWC3_CIOCTRL_CIO_EN?

For us, it seems to be hardwired (not sure if actually, but definitely
effectively) to a separate register which is used to select the right
clock mux for the USB3 protocol adapter to work (which is to be set if
USB3 tunneling is going to be used)

Moreover, the register definition for our SoCs calls all fields of
CIOCTRL read-only, whereas the DWC programming guide says they're R/W -
possibly supporting my theory above

FWIW, our Type-C infra is as such:

1. thick firmware layer running on a MCU that performs mode&PD handshakes
2. drivers/soc/qcom/pmic_glink_altmode.c receives notifications of what
   the FW had negotiated with regards to mode
3. a relatively small subset of UCSI provides PD data (and some altmode
   data)
4. drivers/phy/qualcomm/phy-qcom-qmp-combo.c reprograms the PHY based
   on typec_mux events in native cases, or to USB4/TBT mode if the router
   driver requests it [that last part is not yet upstream]
5. [optionally] retimer drivers in between (most often Parade PS883x
   series via drivers/usb/typec/mux/ps883x.c), which act as an
   additional typec_mux/switch in the chain
6. [not upstream yet] USB4 router driver consumes some typec_mux
   parameters (orientation, cable and partner capabilities) and sends a
   command to another MCU to high-speed link establishment. It also sets
   the aforementioned magic register.

At a glance, 2. seems like a reasonably fitting place to set it, however:
* it does not have any sort of a handle to the typec_connector (it
only acts like a mux that sets another mux), and
* it may be going away in the future

so I'd much prefer to keep this logic somewhere near where this iteration
of the patch does - I think it'll be useful for more implementations, as
I'd imagine it'd be fairly commonplace to hardwire CIOCTRL_CIO_EN and
another part of the pipeline that must logically be online for USB4 to
be useful

+Sven, on ASi, is CIOCTRL_CIO_EN (dwc3base + (0xcd20 + ((port) * 0x30))
written to manually?

Konrad

