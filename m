Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52CF48BC10
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 01:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343866AbiALA4C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jan 2022 19:56:02 -0500
Received: from titan58.planetwebservers.net ([51.79.1.102]:53885 "EHLO
        titan58.planetwebservers.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234143AbiALA4C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jan 2022 19:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rAkwdHwQcR/AuHEuW9POvj85ztH2y7gapNX73ynPM+4=; b=ZPJ1QCLyD3t9/L9ARGQju8Es0L
        b/+IwX2anBsS3FMSeBR3Bhp2nHxPsJLAP8Vj1g7R7s819iD0U06KUdatSPF1ChTZjPYY09Lw10hMM
        q7ziHUJQymnsM7FO9uYeWvnsYpUxOPrIwcAwRq1CzvvnQlum6YczCLA2QSrURgih/5kvO4DMmYNZV
        Om67VTeU9htlQHE1uFw99xsI+ZU+OLw3hdfNoIRY5ZiPfrIU8sDLNzDwV5JdertkujUkofpgSfU8M
        OlpYWw73lHRK2xZ/bjRdzyX1EFVSpwT7azOiMn8DnwlpVNOqlBfr6/K0be8+LH6f4TmXLyIMjxPMS
        tdlsv7DQ==;
Received: from [185.245.86.55] (port=42402 helo=[10.5.0.2])
        by titan.planetwebservers.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <bjlockie@lockie.ca>)
        id 1n7Rvm-0004e8-Tp
        for linux-usb@vger.kernel.org; Wed, 12 Jan 2022 11:56:01 +1100
Message-ID: <4f903a1b-61e4-9433-2e04-39bbb5f6401a@lockie.ca>
Date:   Tue, 11 Jan 2022 19:56:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: no name mouse?
Content-Language: en-US
To:     linux-usb <linux-usb@vger.kernel.org>
References: <9cb86662-d1f6-5d7e-65a4-c5a071e9b4f1@lockie.ca>
 <0895680e-8a4a-7eea-e5c8-f6c29867e563@infradead.org>
From:   James <bjlockie@lockie.ca>
In-Reply-To: <0895680e-8a4a-7eea-e5c8-f6c29867e563@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> You could look at 'lsusb -v' for that device and then look at these fields:
> (e.g., from a "transceiver" device for a wireless kbd/mouse)
>
>    iManufacturer           1 Dell Computer Corp
>    iProduct                2 Dell Universal Receiver
>    iSerial                 0
>
> You should see iManufacturer and iProduct set to 0.
>
iManufacturer           0
iProduct                1 USB OPTICAL MOUSE
