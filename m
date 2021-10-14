Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64D942D028
	for <lists+linux-usb@lfdr.de>; Thu, 14 Oct 2021 04:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhJNCDZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 22:03:25 -0400
Received: from mailout.easymail.ca ([64.68.200.34]:36842 "EHLO
        mailout.easymail.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbhJNCDZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Oct 2021 22:03:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by mailout.easymail.ca (Postfix) with ESMTP id A6981A89A8
        for <linux-usb@vger.kernel.org>; Thu, 14 Oct 2021 02:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=braewoods.net;
        s=easymail; t=1634176880;
        bh=HeHl9e6sE4k8E1m2C4cjtSvyQ7Ln8qT+PccfhQwi9qA=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=ZzMMu+je320z16nqQJSWEAvWafizDM2fMCQeskMZvePdeUPjM/McEpIiYZRDKDeLN
         u7bcKNHVKfjQdIKqHOtj5Qog/ThYYI9JOIUSXH+Qag5/UWhooy0A5/RBUKhrO8zKEr
         uZXq3Qg6AXFnHfka4zdNjPQ5nHbAf70k740yuZV2oYIgW4vILkI2JlJLt5eZGCpoeV
         n9jTFsoGareqfJTVF0mcndSjX0AON1wD25K8R2/fQ+pcqPTfaVENTYL1eoAamUR0xA
         AidIJczOcneSWVqv0Rc7jym86izfiuFQInPONUk/fHKRtl/eVlvVOGDZYBcJHgehNs
         Uuk/sBVH20eTg==
X-Virus-Scanned: Debian amavisd-new at emo04-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
        by localhost (emo04-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BbL_ki4qxLMM for <linux-usb@vger.kernel.org>;
        Thu, 14 Oct 2021 02:01:20 +0000 (UTC)
Received: from messages.easymail.ca (unknown [172.17.13.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailout.easymail.ca (Postfix) with ESMTPSA id 65BB9A89A6
        for <linux-usb@vger.kernel.org>; Thu, 14 Oct 2021 02:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=braewoods.net;
        s=easymail; t=1634176880;
        bh=HeHl9e6sE4k8E1m2C4cjtSvyQ7Ln8qT+PccfhQwi9qA=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=ZzMMu+je320z16nqQJSWEAvWafizDM2fMCQeskMZvePdeUPjM/McEpIiYZRDKDeLN
         u7bcKNHVKfjQdIKqHOtj5Qog/ThYYI9JOIUSXH+Qag5/UWhooy0A5/RBUKhrO8zKEr
         uZXq3Qg6AXFnHfka4zdNjPQ5nHbAf70k740yuZV2oYIgW4vILkI2JlJLt5eZGCpoeV
         n9jTFsoGareqfJTVF0mcndSjX0AON1wD25K8R2/fQ+pcqPTfaVENTYL1eoAamUR0xA
         AidIJczOcneSWVqv0Rc7jym86izfiuFQInPONUk/fHKRtl/eVlvVOGDZYBcJHgehNs
         Uuk/sBVH20eTg==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 Oct 2021 21:01:20 -0500
From:   braewoods@braewoods.net
To:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-storage: Add compatibility quirk flags for iODD
 2531/2541
In-Reply-To: <20211014015050.2694967-1-braewoods+lkml@braewoods.net>
References: <20211014015050.2694967-1-braewoods+lkml@braewoods.net>
Message-ID: <ef0a86b2e27fd6b359fd5569fda139c2@braewoods.net>
X-Sender: braewoods@braewoods.net
User-Agent: Roundcube Webmail/1.3.3
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Please disregard this patch. I updated it in the next thread because it 
was out of order in this one.
