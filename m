Return-Path: <linux-usb+bounces-97-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 612387A1262
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 02:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AD6C1C20B2E
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 00:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5442537B;
	Fri, 15 Sep 2023 00:34:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99603365
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 00:34:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0EA269D
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 17:34:16 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F0Okku015688;
	Fri, 15 Sep 2023 00:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=n2CdsTTxpddfIuknIc5P++0Lgm9Ija8nUktvQW/NgS0=;
 b=meijXGgeKU7A5AA5NMxPdIdfJf9jyGqV/T57LZqEfUikPD1d38YcI2Bewd+gxiws/G8F
 /Df8LudoNPCDMH68SIUWW/97KfXVZ6uVmtG7mxtMXfQ+XSBCg05KpE3ylXoeS+tMkovs
 L7iUvfqB4Y/hFh1L+3JCf7OrmkjN8e1GE+sdtAZieqvPSbx4inefesZGfRlO3Ipw/dHL
 zPlW+02JzCU0YJDrd1EvntZy6RJU4a+er988DJRcZOE2Lrbvun7bAODIszXZLe8NA+2t
 +O7zquiJ8CsHl11xMXjyulH9mg5rQGrM+tBrsdRQhZURp90iVnx1EhzVC5wQoIE9uhTi KA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t41sr21ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 00:34:11 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38F0YBGe012654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 00:34:11 GMT
Received: from [10.71.114.108] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 14 Sep
 2023 17:34:10 -0700
Message-ID: <250ba21f-5d9b-a8c4-1a3b-82b67a827cc5@quicinc.com>
Date: Thu, 14 Sep 2023 17:34:05 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFT PATCH] xhci: track port suspend state correctly in
 unsuccessful resume cases
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: <quic_jackp@quicinc.com>, <linux-usb@vger.kernel.org>,
        <gregkh@linuxfoundation.org>
References: <291f2270-5afc-7570-91cd-049c590b704f@quicinc.com>
 <20230914092724.1469813-1-mathias.nyman@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20230914092724.1469813-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j5U3uH2boacRJO5S7VH8x0ZB4kVUz3Lm
X-Proofpoint-GUID: j5U3uH2boacRJO5S7VH8x0ZB4kVUz3Lm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_13,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 mlxlogscore=558
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150003

Hi Mathias,

On 9/14/2023 2:27 AM, Mathias Nyman wrote:
> xhci-hub.c tracks suspended ports in a suspended_port bitfield.
> This is checked when responding to a Get_Status(PORT) request to see if a
> port in running U0 state was recently resumed, and adds the required
> USB_PORT_STAT_C_SUSPEND change bit in those cases.
> 
> The suspended_port bit was left uncleared if a device is disconnected
> during suspend. The bit remained set even when a new device was connected
> and enumerated. The set bit resulted in a incorrect Get_Status(PORT)
> response with a bogus USB_PORT_STAT_C_SUSPEND change
> bit set once the new device reached U0 link state.
> 
> USB_PORT_STAT_C_SUSPEND change bit is only used for USB2 ports, but
> xhci-hub keeps track of both USB2 and USB3 suspended ports.
> 

Thanks for looking at this change.  Tested it on my environment and it 
looks good to me:

//Disconnect while bus is suspended (before get status)
msm-dwc3 a600000.ssusb: DWC3 exited from low power mode
xhci_resume: usb3 suspended_ports = 0, bus_suspended = 0
xhci_resume: usb2 suspended_ports = 1, bus_suspended = 0
usb 1-1: USB disconnect, device number 2
msm-dwc3 a600000.ssusb: could not transition HS PHY to L2
msm-dwc3 a600000.ssusb: DWC3 in low power mode

//Plug in after disconnect
msm-dwc3 a600000.ssusb: DWC3 exited from low power mode
xhci_resume: usb3 suspended_ports = 0, bus_suspended = 0
xhci_resume: usb2 suspended_ports = 0, bus_suspended = 0
usb 1-1: new full-speed USB device number 3 using xhci-hcd
...
msm-dwc3 a600000.ssusb: could not transition HS PHY to L2
msm-dwc3 a600000.ssusb: DWC3 in low power mode

//Remote wakeup
msm-dwc3 a600000.ssusb: DWC3 exited from low power mode
xhci_resume: usb3 suspended_ports = 0, bus_suspended = 0
xhci_resume: usb2 suspended_ports = 1, bus_suspended = 0
plantronics 0003:047F:C025.0002: intr, xhci-hcd.2.auto-1/input3, status -2
msm-dwc3 a600000.ssusb: could not transition HS PHY to L2
msm-dwc3 a600000.ssusb: DWC3 in low power mode

Will update my change ([1]) to include testing for the suspended_ports 
for if a device is connected (and suspended) while running xhci_resume()

Thanks
Wesley Cheng

[1] 
https://lore.kernel.org/linux-usb/20230901001518.25403-1-quic_wcheng@quicinc.com/

