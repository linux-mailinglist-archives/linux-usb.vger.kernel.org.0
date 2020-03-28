Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D022E196849
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2020 19:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgC1SGP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Mar 2020 14:06:15 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:53278 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgC1SGP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Mar 2020 14:06:15 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02SI3wi5089737;
        Sat, 28 Mar 2020 18:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=8yroq0NyydKbdeQAh1IWDI69kbHqW/3PZP4O8Z74eeM=;
 b=Vnq35nKw0vrNF7XqtFmAsb/kMkqgpzQM3UdH6OZxWYmcoVD7VI05j+tuO4DqVa+yI4eS
 y1tlZNP7JCLkznKeNGjUYZnm7VKMaxbtqKrPNoI/agU517jbmXkTDP6YEOGYs/ShKeTr
 hzuWZls9qJrSLyHlfkD49dkym8P35XzzIAkwPZf6wMHHnxh0LeuMv3D81nOQUnIv9yoS
 uT+0Rb6deHrmCJH/Oe3WWOpyvWH/yllqadDQKIs7d4H4/g+Do7QHMrrb7yzSD1p6PccB
 Cdn7MkSx7U1cj48D/qqZ77cU6JCYLc3ac2Jkax5znp7ePnhtbjQT8QNtPrc2uIkDlRBX fQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 301xhkhbsb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 28 Mar 2020 18:06:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02SI4w4w020216;
        Sat, 28 Mar 2020 18:06:05 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 301xd1t3uw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 28 Mar 2020 18:06:05 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02SI62Nu017076;
        Sat, 28 Mar 2020 18:06:04 GMT
Received: from [192.168.1.140] (/47.220.71.223)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 28 Mar 2020 11:06:02 -0700
Subject: Re: ehci-pci : WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2003281135130.1088-100000@netrider.rowland.org>
From:   John Donnelly <John.P.Donnelly@Oracle.com>
Message-ID: <225cfc1f-e520-cff0-404a-a67ca2bdfbef@Oracle.com>
Date:   Sat, 28 Mar 2020 13:05:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2003281135130.1088-100000@netrider.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9574 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003280172
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9574 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003280172
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/28/20 10:37 AM, Alan Stern wrote:
> On Fri, 27 Mar 2020, John Donnelly wrote:
> 
>> Hi,
>>
>> I am seeing this WARNING event with iommu=off when booting a DL380
>> server with a 5.4.17 kernel.
> 
> ...
> 
>> The end result is this USB port is not configured when
>> dma_direct_map_page() is called and it returns return
>> DMA_MAPPING_ERROR;
>>
>>
>> When I boot the server with iommu=on I don’t see  this sequence :
> 
> ...
> 
>> On an older kernel  5.3. flavor I am not seeing this behavior, and the usbhib devices  appear as expected :
> 
> I forgot to mention: Since you have one kernel where the WARNING occurs
> and one where it doesn't, you can use bisection to find the commit that
> was responsible for the change in behavior.  If you care to go to the
> trouble...
> 
> Alan Stern
> 


Hi.


Yes that is the plan ! It may take awhile.




-- 
Thank You,
John
