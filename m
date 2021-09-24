Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCC6417048
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 12:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240521AbhIXK0B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 06:26:01 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:51712 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240310AbhIXKZ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Sep 2021 06:25:58 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 351B020E9251
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mlJlOiBbUEFUQ0hdIFVTQjogcGh5OiB0YWh2bzpy?=
 =?UTF-8?Q?emove_unnecessary_debug_log?=
To:     <yangzhiwei@uniontech.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <20210924182215.53718a246a8bc81e6c01c082@uniontech.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <2f06b8e5-406a-2dd6-0ab6-68937fd0b42f@omp.ru>
Date:   Fri, 24 Sep 2021 13:24:06 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210924182215.53718a246a8bc81e6c01c082@uniontech.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.09.2021 13:22, yangzhiwei@uniontech.com wrote:

> oh ,thanks for your reply.
> I was worked on 4.10 kernel the last two years, and I am sorry about my 
> carelessness on features of new versions.
> 
> Now, should we remove the two dbg lines?

    Definitely!

[...]

MBR, Sergey
