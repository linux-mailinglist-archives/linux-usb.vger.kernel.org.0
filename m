Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D13036AF8D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 10:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhDZINj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 04:13:39 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51430 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbhDZINg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 04:13:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619424775; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: Subject: From: To: Sender;
 bh=jXrBEIOyOWfYEO+JBCrChzVbK/WGyMEXaEzTYt9VoIg=; b=Ntn8cvA35chhvJZnqG0OL9LMi/9nxpfc8ju8tBF3BaIs9WmUQjgN+xxCIwjKF3DFUKwQLXu6
 BL49udlIZUyJNZge9XuRhYSFi4z3ppBag4JO1ZPOU+MzYlHCpNZJwVwBNKXtRnMJCWiEokhV
 2NITRAgsRIKzxXXx/k5FWbTNFUs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60867606febcffa80f21b237 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Apr 2021 08:12:54
 GMT
Sender: prathampratap=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7F76BC4338A; Mon, 26 Apr 2021 08:12:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from [172.20.10.6] (unknown [106.207.79.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: prathampratap)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 69965C433F1
        for <linux-usb@vger.kernel.org>; Mon, 26 Apr 2021 08:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 69965C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=prathampratap@codeaurora.org
To:     linux-usb@vger.kernel.org
From:   Pratham Pratap <prathampratap@codeaurora.org>
Subject: ep0 request dequeue for function drivers
Message-ID: <655514e3-90c1-e628-d5e6-efb298f49038@codeaurora.org>
Date:   Mon, 26 Apr 2021 13:42:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Let's say a function driver queues a request on ep0 and before the 
completion handler could run composition switch/physical disconnect 
happens. This request will be in pending list since gadget_giveback is 
not done but the composite driver will free the request from 
composite_dev_cleanup. Now, once the next connect happens, another ep0 
request is queued and while handling the completion of that request, 
gadget driver might end up accessing the old/stale request leading to 
list_poison since pending list is corrupted.

To fix this, the function drivers might want to use setup_pending(mark 
it to true) flag so that when composite_dev_cleanup is run the requests 
are given back from usb_ep_dequeue; clear the setup pending flag in 
function driver when completion handler is run successfully. I can see 
this issue in almost all the function drivers.

Looking for suggestions and comments.

--Pratham

