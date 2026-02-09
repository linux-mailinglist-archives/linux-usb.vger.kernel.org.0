Return-Path: <linux-usb+bounces-33210-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KNRA14YimmsGwAAu9opvQ
	(envelope-from <linux-usb+bounces-33210-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 18:24:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A7F113069
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 18:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFB8F30347AF
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 17:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EF438886F;
	Mon,  9 Feb 2026 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KuVZU+j5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHNGAlzT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A1538885F
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 17:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657825; cv=none; b=eOAaR75uJBc7uVBQ0qfXthaNUIag7BwoMZez9xcapvMfJgKqd9s7g3as7VAsOS/sfXkD0Jc7dkrFzsndVBYSoC+uHifmxLQxY8aJeV47IfaJuTw6N/2435fsUbb1BYp0usndM3y5K5wCSn2jtyuQq/7N57LHXtF4Wn6tf+9EKOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657825; c=relaxed/simple;
	bh=tNiEjlgAVv8hjtDJWGggX5NGcn2AHeRiES9LtbdL2n8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFgZNwjpXcJUKwErTCm6/rK7ga8WfclhAAVC9tCHwbokfvqldp4JX3Tm9Wf/Pvdf2uPk9uB7pG88GNpzNfmz3dgjeikHaQWG/yGSzWXG9eMRgGamk3fhsB2BEahFwouNXXVKNLNgbzB7RHQYYEUIk8+sEEauDJglg/g7rCqgdg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KuVZU+j5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHNGAlzT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619CGqlS3436716
	for <linux-usb@vger.kernel.org>; Mon, 9 Feb 2026 17:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKBKk6gqAHFPDJeGGIwYuEXPKG9/jo3JCSTnT3Can6g=; b=KuVZU+j5CMlnLppc
	naKW8opmc6lyMlQid2lE6Bl//Wl0T4WD2vBBR+efHoL3b+VOhXYLn2ASSjZVwxjd
	D4VqDuPLgDNXDX5VJiZAm0jhHAya/d/qjGWpRsjRHUbRz12z+t9ebLAA5+9GYtcJ
	joigTMG08Wvm5i7ReLO0uDJBlKUXthyu9PhS/uYx45IQKlrV8dH5zZulwlVhFgTO
	lrjVfkjobRmiY5RYNq6cSFDAmeBnlinDZyuWE5TDjnadc3N4ef362lbW5YGTYVVs
	vnLPtxQQIhjmvwVXmNk7ZjvT9f9pQDZwa0wStiidjPLyBDk9mkomKFP4emWLUURO
	5H3ynA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7fev90g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 17:23:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba68ed568bso473401eec.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 09:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770657823; x=1771262623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKBKk6gqAHFPDJeGGIwYuEXPKG9/jo3JCSTnT3Can6g=;
        b=YHNGAlzTvZtT9i4FyjmLHofE1vc3Ge3eyH7Kc8UR5n6U5st9f4Oig3j8O6xtOkWqDi
         /F79nzOzuuQaxziQS1NtUaML+DGGAL/1ozFVbshVhTKFDfgvV6TdzFxj/yvS9NR0W5E/
         QI92Q0kMhFCKJkp4GAwiYWjZi61F+XTknz0icJrZ4QzoFG2HSNYOeraTEYqsKv7+TACJ
         VUhKcKhoMH4ccMev9Q+qmRymap83X/tvsM1YTdZx8E2mBAJzyn+0HTrTg7md26QdQsda
         viqI6p1i029JkMEYdKjLiFw64cmiAxkkA0APZtejtJ/s+7NnLs1lxk8Smo9XBCM9qWav
         8yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770657823; x=1771262623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKBKk6gqAHFPDJeGGIwYuEXPKG9/jo3JCSTnT3Can6g=;
        b=L5ono7rPcSnoRukdVmGbTexMvaQL8Nb144ZcAYgsC91HxtPsiVXX1bgLeCP7p7OXJT
         uXHmc/XEw8JCTGRfV+ZPecyW0Ohsba/xeuhG0/0d98aY8EtjI/wqBf1oz8n99AxqmR56
         PBXKEuDBVhk4TodUtxfqNs2+OmOi31EPERaYUFSM4D3TL38CR65TbyMHOd1unQ0upvGb
         qM4ZpE4mgSVV2/7t4DpL9jcM/lQdtLQJv6ee5T680n5i+nL71NHAyx1b/e6OC+K9fUkn
         YljLeP3Zh/ObiGsvnAir3H2xc9bxIrL9PmG7+5/bLH0IP0Do6fUVEAT/alVC/qTU5FSq
         k1UA==
X-Forwarded-Encrypted: i=1; AJvYcCUcAd/S3Zwr5KmqTK3BT2BgTvDvMnek3oE3iZfbg+VVCrrRz9KRq1w471njDtDH5LSS45OPyTESUDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/W+cFSsbbpiWjlqhf65TAdrc3RykzipwtUjB6LYg1nJe2gmpN
	rSB7EV77pnm7iLGtk492wNXqh6Ey/cjYQ4Ph+morrzeFSQVrYyzmevF0HsosWbMpoMIEyiL51bq
	AbRlzO60hKdhFZkel3P+TsSiUaDZKzo+VpmKUXoMa9HSUh/QWQz3cY/1STm8NM+o=
X-Gm-Gg: AZuq6aJ4nXRV1GquHUPS0s4rfAr0hRE+2KJ55QGRdScEwl7ma/R+ZTOn0LC9c4gfJq5
	4K6yOmdXSPneP0OU9HAAnXieDnNWbQL7nBqVyB4B+ARSL9nQifAq/xrtCI7IgZlpzSCKznQsvYV
	OBjxNKuOaW04DDCbxbJtFm+GMKJcLhXEcfa6UI0edQxytRrIivOyxjW+A+1lDQmDX0BwNX0S7M2
	UejE5/o3dJiFAtcUstKQuQc35oJ4qHPBHcy2H58OaM5fs70/U/n21NHg2kuPmoTxti8oLez2tdc
	Vn7HlRMlVHMthCy4s69A3F5Pd37HvIqmLtQjIA1z5sSaDWKh8eAR2p2/VkC07yziHzBFqcw+fxE
	jB+QZqH9aB4kW3BndKqkiTxDr13qe6TMW2N7IRDc=
X-Received: by 2002:a05:7301:4e09:b0:2b7:c285:837d with SMTP id 5a478bee46e88-2ba884a9c27mr78910eec.4.1770657823237;
        Mon, 09 Feb 2026 09:23:43 -0800 (PST)
X-Received: by 2002:a05:7301:4e09:b0:2b7:c285:837d with SMTP id 5a478bee46e88-2ba884a9c27mr78902eec.4.1770657822553;
        Mon, 09 Feb 2026 09:23:42 -0800 (PST)
Received: from [192.168.1.133] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba71a0af3dsm2488984eec.0.2026.02.09.09.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 09:23:42 -0800 (PST)
Message-ID: <94000dfc-3672-4453-9b56-420404a79fec@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:23:40 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-4-elson.serrao@oss.qualcomm.com>
 <9f81c07a-c1c6-4888-975d-528a6181caea@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <9f81c07a-c1c6-4888-975d-528a6181caea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2tvxK7nEseK2fgQev7LbhbzzcyozWLBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE0NiBTYWx0ZWRfX2pRZH+gHSuqN
 nCd4uEmETvTNwac0TaEG1yCsU7WEDtWvjsRxa3Dd7V2AmYgz6LyVYzJe8PXIT4eSCjRcXzu//MZ
 sD26hsiKt+ail/ug4yYhjAuQlnXJ3X65wd9EyBeKgekJk0jxepc1OLnS7g9AyP6bmhNQZYGfY5c
 GRqfS4BBKim9KXYZ6amuafrpq5yeV+tp0l6c0853MVtb7KEsyXkzyUJoyokEtjsD8YXlZmBlRTn
 BTTzyL0G28+GXI2D+L16hIBmmNKxc+A0i4u7ADXAw9IHCf5yO9EC3eAQhDItjZ6+KO3MGNZtuQA
 x8VDOKIMV6cgChRCkZvBJsvBb3XxoGfuFlf/8GHM+3/9Vy9XKokxU3UT4FH0UWL6ysQ3sij66ji
 mowy2zJ24yxzOYNewpnUtbkwo7Q3y82HPbn4DpPD28VI2oD+uJ3+vUlUGZddvbd/kKbcUqgsXNe
 OvoPwAdyNyfvn8T3Ovw==
X-Authority-Analysis: v=2.4 cv=F6Rat6hN c=1 sm=1 tr=0 ts=698a1820 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=i2ahz-mu8vMz2UVK6u0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 2tvxK7nEseK2fgQev7LbhbzzcyozWLBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33210-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86A7F113069
X-Rspamd-Action: no action



On 2/4/2026 5:21 AM, Konrad Dybcio wrote:
> On 1/27/26 12:38 AM, Elson Serrao wrote:
>> EUD hardware can support multiple High-Speed USB paths, each routed
>> through its own PHY. The active path is selected in hardware via the
>> EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to the
>> High-Speed PHY associated with the active UTMI path. To support this
>> multi-path capability, the driver must manage PHY resources on a per-path
>> basis, ensuring that the PHY for the currently selected path is properly
>> initialized and powered.
>>
>> This patch restructures the driver to implement per-path PHY management.
>> The driver now powers the appropriate PHY based on the selected and
>> enabled UTMI path, ensuring correct operation when EUD is enabled.
>>
>> Supporting this requires describing the available UTMI paths and their
>> corresponding PHYs in Device Tree. This updates DT requirements and is
>> not backward compatible with older DTs that lacked this description.
>> Historically, EUD appeared to work on single-path systems because the
>> USB controller kept the PHY initialized. However, EUD is designed to
>> operate independently of the USB controller and therefore requires
>> explicit PHY control.
>>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static int eud_phy_enable(struct eud_chip *chip)
>> +{
>> +	struct eud_path *path;
>> +	struct phy *phy;
>> +	int ret;
>> +
>> +	if (chip->phy_enabled)
>> +		return 0;
>> +
>> +	path = chip->paths[chip->port_idx];
>> +	if (!path || !path->phy) {
> 
> I think neither are possible - path is != NULL since we can't enter into
> this function without failing the check in _store and !path->phy would error
> out in probe()->eud_init_path()
> 
> [...]
> 
>> +static void eud_phy_disable(struct eud_chip *chip)
>> +{
>> +	struct eud_path *path;
>> +	struct phy *phy;
>> +
>> +	if (!chip->phy_enabled)
>> +		return;
>> +
>> +	path = chip->paths[chip->port_idx];
>> +	if (!path || !path->phy)
> 
> Likewise
> 
> [...]
> 
>> +static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>> +{
>> +	struct eud_path *path;
>> +	u32 path_num;
>> +	int ret;
>> +
>> +	ret = of_property_read_u32(np, "reg", &path_num);
>> +	if (ret) {
>> +		dev_err(chip->dev, "Missing 'reg' property in path node\n");
>> +		return ret;
> 
> You can use return dev_err_probe like you did a little below
> 
>> +	}
>> +
>> +	if (path_num >= EUD_MAX_PORTS) {
>> +		dev_err(chip->dev, "Invalid path number: %u (max %d)\n",
>> +			path_num, EUD_MAX_PORTS - 1);
>> +		return -EINVAL;
>> +	}
>> +
>> +	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
>> +	if (!path)
>> +		return -ENOMEM;
>> +
>> +	path->chip = chip;
>> +	path->num = path_num;
>> +
>> +	path->phy = devm_of_phy_get(chip->dev, np, NULL);
>> +	if (IS_ERR(path->phy))
>> +		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
>> +				     "Failed to get PHY for path %d\n", path_num);
>> +
>> +	chip->paths[path_num] = path;
>> +
>> +	return 0;
>> +}
>> +
>>  static int eud_probe(struct platform_device *pdev)
>>  {
>> +	struct device_node *np = pdev->dev.of_node;
>> +	struct device_node *child;
>>  	struct eud_chip *chip;
>>  	struct resource *res;
>>  	int ret;
>> @@ -252,6 +368,18 @@ static int eud_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> +	for_each_child_of_node(np, child) {
> 
> With for_each_child_of_node_scoped(), you can dispose of the manual
> _put()
> 
>> +		ret = eud_init_path(chip, child);
>> +		if (ret) {
>> +			of_node_put(child);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	/* Primary path is mandatory. Secondary is optional */
>> +	if (!chip->paths[0])
>> +		return -ENODEV;
> 
> I'm going to assume we don't have any funny chips that violate this :)
> 


On all current SoCs, EUD_PORT_SEL defaults to 0, and the hardware guide
defines this as mapping to USB port 0. So the primary path being mandatory
is a valid assumption for existing hardware.

Thanks,
Elson


