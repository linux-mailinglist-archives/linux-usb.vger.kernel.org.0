Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E1835D0AE
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 20:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236754AbhDLTAE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 15:00:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54592 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236569AbhDLTAE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Apr 2021 15:00:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618253986; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: Subject: From: To: Sender;
 bh=nqpaAFI8Q+bA3N0RI+EwsScWjn59R+Tw9dWhiU41Nww=; b=HgBk976XIQXfOfDD/DN4k8RQsJ1GlsMJKCTYRSZTagIap6cuyW65oGrgdrvdC8avU1MHy4ZQ
 bhaQlGerEEjwKcdZb0nenUgcmqbFJNIdeHpuF9xPVJppou/zTNfkZlTITYaGQk8RuCIPxCD0
 1fwI9lZI36aKtHV5fIBVdeS0uwk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6074989cfebcffa80fbf76b9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Apr 2021 18:59:40
 GMT
Sender: prathampratap=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7FBF1C433ED; Mon, 12 Apr 2021 18:59:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from [172.20.10.6] (unknown [106.207.75.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: prathampratap)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73735C433C6
        for <linux-usb@vger.kernel.org>; Mon, 12 Apr 2021 18:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 73735C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=prathampratap@codeaurora.org
To:     linux-usb@vger.kernel.org
From:   Pratham Pratap <prathampratap@codeaurora.org>
Subject: USB port resume can take 60 seconds in worst case scenario
Message-ID: <075be7a2-eb78-f6b0-6051-a83bc70955db@codeaurora.org>
Date:   Tue, 13 Apr 2021 00:29:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

The current implementation of usb_port_resume 
(usb_reset_and_verify_device()) can take up-to 60 secs in worst-case 
scenario if the device (let's say the device went bad and is 
unresponsive to any setup packets) connected went into runtime suspend 
and resumed back. Is it fine to have a configurable upper bound? Since 
it can induce delay in the overall system resume if the host is waking 
up from PM suspend.

[USB port resume in worst case ]

usb_port_resume()
finish_port_resume()
usb_get_std_status()
usb_get_status()
USB_CTRL_GET_TIMEOUT : 5 sec


usb_reset_and_verify_device()
SET_CONFIG_TRIES 3 (use_new_scheme: 2 /old scheme: 1)
hub_port_init()
GET_DESCRIPTOR_TRIES 2
operations < 3

     2*2*3 (12) * 5(USB_CTRL_GET_TIMEOUT) = 60 sec


Thanks,

Pratham

