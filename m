Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928E2193859
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 07:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgCZGKu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 02:10:50 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:39131 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725819AbgCZGKt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 02:10:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585203049; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: Cc: To: From: References:
 Subject: Sender; bh=2qmM9rvg+Ye3PtZPQkFlLPwXh330tVOMaGDk8+/rA1M=; b=Ijx3B2+8TQDSitEmPwLwlNPGcvsRd2brUkI/86HyXZuMuumWzZUJrcWyTYjaDeFdu1srnwQk
 ABEMk6R87b6/5g8rVA790ASP96nb9bFLJzCQQK+3HXiHbarqV6nmVHXYs/UkgbeKVFqvRYCp
 ileQ13NJy33wnIW27cAVYFPifkE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7c4767.7fdb1595f458-smtp-out-n04;
 Thu, 26 Mar 2020 06:10:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CFA6FC433BA; Thu, 26 Mar 2020 06:10:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [192.140.154.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sallenki)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D465FC433F2;
        Thu, 26 Mar 2020 06:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D465FC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sallenki@codeaurora.org
Subject: Fwd: [DWC3][Gadget] Question regarding the unmapping of request as
 part of queue failure
References: <0105a5cd-936e-fb08-77bf-c2f1dbf0aeed@codeaurora.org>
From:   Sriharsha Allenki <sallenki@codeaurora.org>
To:     "balbi@kernel.org" <balbi@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
X-Forwarded-Message-Id: <0105a5cd-936e-fb08-77bf-c2f1dbf0aeed@codeaurora.org>
Message-ID: <53a4614f-d1bc-5856-8e01-eb790a6ff7fe@codeaurora.org>
Date:   Thu, 26 Mar 2020 11:40:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0105a5cd-936e-fb08-77bf-c2f1dbf0aeed@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

I was looking at the code flow for ep_queue and came across the
following piece of code.

__dwc3_gadget_kick_transfer {
 
    dwc3_prepare_trbs(dep);
    req = next_request(&dep->started_list);
    if (!req) {
            dep->flags |= DWC3_EP_PENDING_REQUEST;
            return 0;
    }
}

As part of dwc3_prepare_trbs(dep), we get a request from the pending_list
and queue to the tail of the started_list. But here we get the head of
the started_list, now if there is any failure in issuing UPDATE_TRANSFER
to the core, we unmap this request using "dwc3_gadget_del_and_unmap_request".

But if this kick_transfer was part of the ep_queue and we have failed
to issue update transfer, instead of unmapping the request we are trying
to queue, we will be unmapping a different request (first in the started_list)
which the core could have already started processing. I believe we should unmap
the request we are trying to queue but not any other.

Please provide your comments on this.

Thanks,
Sriharsha

