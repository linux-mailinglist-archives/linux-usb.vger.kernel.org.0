Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0ECB60113A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 16:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbiJQOhH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Oct 2022 10:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiJQOhG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Oct 2022 10:37:06 -0400
Received: from titan5.planetwebservers.net (titan5.planetwebservers.net [51.222.33.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6186E60CB4
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 07:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
        s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
        References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Q49K2CcSkJh55GGbhyKI2uSvI95q52ryOVs+Tys93QU=; b=My5CAt1gAPfOI0zw6zOlaxIBBT
        /UGHfjiVz4QWyGGdighULLYR6gY3nsotWonmp8l/1s1nodJxwGSqp2o+Ge4qCqo0LpjfVkzrQBb7s
        zLyEIlFvI7vLZm1FObU1S5DlVmfQ/dqz5YXOH8gXWbjIsn6N6jjFZkQZFXA64iWKa/ycWzPR4IMMr
        JlJFYxBSz5GuTEw93ouYgevn95pSIW3UdOEamjAemW5RiwS7/shhVGp117c5RBs1zwugo9LEp/QQK
        o0HDhhd8EiptAScGEAA/y0Y7IHAfEdTkDLnPI5FbHoUlot0ceyrhWfB4anIcc9o0DqYAiRKLfLbS5
        /C8SxImw==;
Received: from [66.79.242.44] (port=44931 helo=dummy.faircode.eu)
        by titan.planetwebservers.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <bjlockie@lockie.ca>)
        id 1okREe-0007OW-R8;
        Tue, 18 Oct 2022 01:37:04 +1100
Date:   Mon, 17 Oct 2022 14:36:55 +0000 (UTC)
From:   James <bjlockie@lockie.ca>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Message-ID: <7cb0f51d-6ad1-488d-a989-08eb6727e9b7@lockie.ca>
In-Reply-To: <Y0zheI+RSeLNulpx@kroah.com>
References: <8526b38d-64b2-05b0-48e5-a54936f6332f@lockie.ca> <Y0zheI+RSeLNulpx@kroah.com>
Subject: Re: is usb.ids used anymore?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <7cb0f51d-6ad1-488d-a989-08eb6727e9b7@lockie.ca>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


>> but I didn't receive a confirmation to the email and the ids show up in =
the
>> web interface but there are no names associated.
>
> What do you mean by this?

I tried to add:
7961 MT7921AU 802.11a/b/g/n/ac/ax Wireless Adapter

7961 shows up but the description/name is blank on:
https://usb-ids.gowdy.us/read/UD/0e8d

I also tried to add 0608=C2=A0 the 7921k USB Bluetooth portion of a pci car=
d.

Someone else added 2870 but it doesn't show a name either.

I expected to get an email back acknowledging my diff submission.
I did it on the website too.


>
>> The link to the maintainer is no longer valid. :-(
>
> What link?

It says "This site maintained by Stephen J. Gowdy." and has a link to http:=
//cern.ch/gowdy which is 404 not found.


>
>> Wouldn't it be easier to keep in a github if it is still used?
>
> Why is github easier?

It tracks the commits of who added what.
I guess it would be harder for people who haven't used git.


Should it say:
802.11a/b/g/n/ac/ax Wireless
or should it say:
Wifi 6
?
