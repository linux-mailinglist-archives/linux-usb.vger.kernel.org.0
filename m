Return-Path: <linux-usb+bounces-29433-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 985F2BEDF19
	for <lists+linux-usb@lfdr.de>; Sun, 19 Oct 2025 08:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7AE189C8B4
	for <lists+linux-usb@lfdr.de>; Sun, 19 Oct 2025 06:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4127A22256F;
	Sun, 19 Oct 2025 06:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaN/LIKb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2643F354AFD
	for <linux-usb@vger.kernel.org>; Sun, 19 Oct 2025 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760855672; cv=none; b=n7Cz0/W2B7kdBX7NsOrj+bJRrZW1bkIwX/4HVq2I1RQyGwa89gc1OTOBgZyg+Z7zpqpuFlctfDsSrDlS2BJoNWNxLzq7imZB/8Jz3ub/9wCi/klej2JL9KVq0rZgsBkdFLob1ZR399sGV9MKQSIXHqBb/GLkxOxIYR/6gZQ5a2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760855672; c=relaxed/simple;
	bh=xqE7kNeos6SSQemCLWMoy6bk+u6IBCQAHH/tfpAIy0s=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=q+HyCEDZWo3R8b9YqTilpfdwIGQOrGE3gBtWGj9G8xGEHeRdZz7DkSLNSOp3Wx0i9v3V+JSK28VgxtHdvUE6ez7FPTgRI3BusQ/1/0zLiKzQ17fmBOjzwKBcMp27ubakhX91DrZ3hjKZDnIACHOSysz5Nv9VILUaZHROECUp2zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaN/LIKb; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42706c3b7cfso896726f8f.2
        for <linux-usb@vger.kernel.org>; Sat, 18 Oct 2025 23:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760855669; x=1761460469; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JvpWQG4jJrJARqz3WjoG9KDjXp6aWGo4wKhlJ5LLTU=;
        b=ZaN/LIKbZya5UiAzAl/qfD2kECXdaRHu8Ta82OJduB7zZX1C3u1afObKE8Q/ldnQFo
         a/svSj2S8h/G5HT5rRhZ0AnR/rDVGdmNHhOFK+nfd4+wmmmVO4ml+shI40/wYrA5A9Kh
         hyXKjvmQg0d/DMiCv9IXnZFHZtaQJlR9KbjAqTYLoBP0sZLw+jL7JB3GbgeKZJCsmCmk
         R0cS0tvqhjjUezG0RbQkUEXXLpFgzzMKFm4IIi+1SWgrEsTxH0sSTidlYIz9qsOhe43I
         nEm7m8IJG1OeRtalCg9QOjyjYMTx4+XgzFNe3dOEQtBLBieaJLg/zQcWRTDUvwU9vFAD
         kWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760855669; x=1761460469;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3JvpWQG4jJrJARqz3WjoG9KDjXp6aWGo4wKhlJ5LLTU=;
        b=hbXDUPfBX8wGX5r0L88vIFM04hd4zuG7dzxp6uXv+QAupMjoFPyjHh149SaTjzVREB
         +Rd6zdcTBk+cWjApvcEIfS+1kOJdWLnUTcX4gFRiTnHM4vjNhuAPhhPyNHmZrzgFLFfi
         r23oz3zd8icLdOkamek0voVTMryO/uLeOQgUbejHxd/969K2LTVV3r/zTLvS3tyUhXGA
         kkDjDFDtsTFglIfa2rD1S1AG2BTWBHMtoDRM8bKBm53kn2eumLVPMVL6PqkVxmOgDP/G
         X38pjn9gY2oqBuOyfMf917w10uwhpX946t2xekvjmDTqPvWO6l2rJWx4Hb38tN0y+pvT
         aZjA==
X-Gm-Message-State: AOJu0YzGIJYqwl9NmsPfWsXbNj9PZfX8de1BYo6ZcS+Wof/OB3pIGGjj
	LVOjbl8vSSYBAe+nR3YB0wGksONTOJ7PWVtZtB7uHT2OCGYprE/0Egk5J1iLkg==
X-Gm-Gg: ASbGnctrOUi/BWVp31DE5YYKGe5ixGKb3RnPPefennMnCRurOjXVA2l9aFhEGzPH7KI
	yuzWG4NHKEivsrk5EnB1V08kpSlI1eBGpH0q1nTTJQ3d/Rvp5au/JpWVQY2aBHZ6J7/0yvyxPG3
	RLnoIWbnXp0NKXf2qUxobSXfLJ2NH/jVWpMCUtFn1nppOCGNujh20JQmF6caB0kZ5dx2XKiIwAf
	7jAIQQ1v3i28f2GsQMtYo03qbFepeNkk/SvwwA0KwSSUvo/7lcQMPKzUYu9y8RRi/NOQFlWtuYX
	4sCgNk+UfAbreqJ479z4OAbLJt2d7QTUz3eiEZF5tLETs6xuC1YWLM9+/JVTsFrTIhVG9yLR00u
	72SpJgWXI0kPc7gvXHHkv5smmExvz9nQbAfSsADZSb9cvtVy4+9bNkbJeGL8+EIkhOx7ms+n9Dp
	Eq0Qx5zEGW8xbpxwcYJqXjc8JvuN1lsAhq9lY5ErrGt6CkiiLIlc2vuAaYbMb4
X-Google-Smtp-Source: AGHT+IFqMW24IaKqRFltFIJWi2XntFDGMbcQH8k9rWSw5Ugk6NYTLITOoK6/ZaJ+Ok2IGYikxeAN/A==
X-Received: by 2002:a05:6000:2082:b0:425:7e40:1e02 with SMTP id ffacd0b85a97d-42704d49a0amr5227805f8f.7.1760855668872;
        Sat, 18 Oct 2025 23:34:28 -0700 (PDT)
Received: from ?IPV6:2a01:41e3:2182:7300:e578:7a53:5a19:5ce8? ([2a01:41e3:2182:7300:e578:7a53:5a19:5ce8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3b45sm8635578f8f.11.2025.10.18.23.34.27
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 23:34:28 -0700 (PDT)
Message-ID: <1393a6c5-3430-49cb-95e6-b18c0f5328b0@gmail.com>
Date: Sun, 19 Oct 2025 08:34:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: USB list <linux-usb@vger.kernel.org>
From: Julian Sikorski <belegdol@gmail.com>
Subject: USB A 3.0 port on Asus Zenbook not recognising the TipToi pen
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

disclaimer: this is not linux-specific as Windows 11 also fails to 
recognise the devices, but maybe someone has ideas regarding the causes 
here.
I have two TipToi Pens by Ravensburger. These are recognised as

04d6:e101 Mentor Graphics usbdisk

when plugged into USB C port via USB C to micro B cable. When plugged 
into the USB A port, the following messages are reported into the journal:

Okt 19 08:19:08 kernel: usb usb3-port2: Cannot enable. Maybe the USB 
cable is bad?
Okt 19 08:19:09 kernel: usb usb3-port2: Cannot enable. Maybe the USB 
cable is bad?
Okt 19 08:19:09 kernel: usb usb3-port2: attempt power cycle
Okt 19 08:19:10 kernel: usb usb3-port2: Cannot enable. Maybe the USB 
cable is bad?
Okt 19 08:19:11 kernel: usb usb3-port2: Cannot enable. Maybe the USB 
cable is bad?
Okt 19 08:19:11 kernel: usb usb3-port2: unable to enumerate USB device

I have two pens. I tried two cables delivered with them, as well as a 
different USB A to micro B cable I had. All exhibit the same issue.
Does anyone have any ideas what could be the problem? My first guess is 
that both the laptop and the pen are slightly off-spec in some strange 
way, which causes them not to work together. The USB A slot on the 
laptop works fine with other devices, and the pen works with the laptop 
if connected to USB C.

Best regards,
Julian

