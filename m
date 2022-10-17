Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D131600496
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 02:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiJQAmi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Oct 2022 20:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiJQAmR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Oct 2022 20:42:17 -0400
X-Greylist: delayed 2345 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 16 Oct 2022 17:42:13 PDT
Received: from titan5.planetwebservers.net (titan5.planetwebservers.net [51.222.33.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FDE36433
        for <linux-usb@vger.kernel.org>; Sun, 16 Oct 2022 17:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
        s=default; h=Content-Transfer-Encoding:Content-Type:To:Subject:From:
        MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=XUrdwwEzbzlmPtoZLbrjQVIJoBwkt7I8sD1fG+kzd48=; b=uxIhOEolJPfi4+pvnvJI+jh1P7
        Pu3474KY5YAKkjDnAJe0eWL9jLye7f9xdL5jwp5/j0qtX9GdNr4kvDEniLGFdFS1uHGdIIxEMKCdb
        jYyzrj74/nUuqt6llavKSjOhjEMQ7YMRfMSzkJC7lizDGm1q7UgcWyxIKNPES8Q5zSikWXioLe70k
        JjKpQ2F8qDPS6hWSMPb7+BGp5yRSOoISJjmGVt0T/dl7cXUh5sxO7UOOdDpFIin7kyf7HNBJzTlT3
        C+OOQaU9Oq8to7f/uIvvwrsSTybcqXenqUImJ7aLX8f3Zg3L2fdQ9zjvgKLcOnQFVJPTpddZN8EhE
        lM8nXkXA==;
Received: from [66.79.242.44] (port=39114 helo=[192.168.68.80])
        by titan.planetwebservers.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <bjlockie@lockie.ca>)
        id 1okDau-0003Np-CC
        for linux-usb@vger.kernel.org;
        Mon, 17 Oct 2022 11:03:07 +1100
Message-ID: <8526b38d-64b2-05b0-48e5-a54936f6332f@lockie.ca>
Date:   Sun, 16 Oct 2022 20:02:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
From:   James <bjlockie@lockie.ca>
Subject: is usb.ids used anymore?
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - titan.planetwebservers.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: titan.planetwebservers.net: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: titan.planetwebservers.net: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I am trying to get usb.ids updated.

There is a link to here:
http://www.linux-usb.org/usb-ids.html

It says the text file is updated daily but the last update was Version: 
2022.05.20.

Is that file even used anymore?

I did the web update and I sent a diff -u to linux.usb.ids@gmail.com
but I didn't receive a confirmation to the email and the ids show up in 
the web interface but there are no names associated.
The link to the maintainer is no longer valid. :-(

Wouldn't it be easier to keep in a github if it is still used?

