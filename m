Return-Path: <linux-usb+bounces-32215-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAE8D169A5
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 05:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53FC03024881
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 04:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7022734FF76;
	Tue, 13 Jan 2026 04:22:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD74315D2C
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 04:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768278125; cv=none; b=QUj6Wv5kIdj2AxJ6jehvteUOOU35+anGCo/L0J//bdacJ2S4y32UQhY8AqKRgXYnZ8fEfcJ2D5T4tIIH62kJlsflKgoTg/WDuIhuTC/uEPsqKey87kr4eNRaHY5JIWRJJB73916Ef9VPoR0aMrUuQk6jPYmNxmrHJj+nNJy5JV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768278125; c=relaxed/simple;
	bh=owKoWGbK4v2T1S1WN851iVy8u2rd4FsbIcAV9SkWkOg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cNE5+26IFCJqUEuIxdh5EYzPxuY+mrbpRwVeEBiNj017dblDrXpQgebcaZ9vHm1x7FD8j6thSjq0IViFBH5bWU7mvHa0DU7l1FeDFUC4O5TeTMqMzmXNFxoA9Eick7l/+CUR8CtY6XIp9WB7oVtGbUAVKi2BkcwS/hRwhjGSdKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6574475208eso7961353eaf.3
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 20:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768278122; x=1768882922;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrZ7j63chGTElr7WTElBWNKirosv+uisN+QtjuDzqtw=;
        b=NO/WQ/nlUN6MC6wqowB7NEyHeAucPnASS/6puYGq2ECy1CbDhDmAq/KkrOaFG+fNVg
         OyA4x7xLZs3A6qY3VVsj8WXAPW/rhIvRlGmsHvr3zktyrGvzCEVoY4fMVpxdP4qbH+Qa
         hmYK/XCXLsGhFeblG3WmNKPoIU8CI6sf+jmQLru12GW154NotMXj6PTIhnfhJqnrgZMC
         6jUgCTxpeirZKjyQszAVGo3splbn3iuPvDUWg65rvHv7wmB/ce9Qxsgt3s4awp3jY0No
         1D47UEVGNORVNhzt82b68Xzf3AE/bQHbI7UIAxHrRL1MeWttTjvpRIbBmpiJqM8IWUOb
         pTQw==
X-Forwarded-Encrypted: i=1; AJvYcCWN3pvQ2R7hrRvk+J5AF691IkPXnRq7EKsDOCjX6jEuRhec0Ew+lM6fa6bR8X/A1uRnbbb07jSWzjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6SZWP+srKHAecNoWKGF1JRUeDnar7eIVGsnKoQXMq25P6tmLk
	TXmlQv/InzDbQ7zUv61y7dnFK47mU/rvXvRiiuc686tbg0wNYg0knWNuuAlVyl2npzZkawPBVaQ
	nSqSsWtgUmqNOECPzH22AAMy2LwJqAYjeZiDcalTvqyzC3iF6IOdHlw1sV+4=
X-Google-Smtp-Source: AGHT+IGR9eo0r5rMw/mIcsdahjP3eAESdkhIez4ixQJ4B46C6OCsLQ73FEe4PgxLAPrlUjmpUCDMRGq24mKpJO6O0rJ02YCiC3QD
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1501:b0:65f:130c:fd4b with SMTP id
 006d021491bc7-65f54ef1d6cmr9739556eaf.10.1768278122293; Mon, 12 Jan 2026
 20:22:02 -0800 (PST)
Date: Mon, 12 Jan 2026 20:22:02 -0800
In-Reply-To: <20260113031114.4030649-1-coderlogicwei@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6965c86a.050a0220.3be5c5.000e.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
From: syzbot <syzbot+30b78308ba7e64647ff8@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, coderlogicwei@gmail.com, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

:sysadm_r:sysadm_t tcontext=3Dsystem_u:object_r:nsfs_t tclass=3Dfile permis=
sive=3D1
[   72.435490][   T30] audit: type=3D1400 audit(1768278064.403:80): avc:  d=
enied  { open } for  pid=3D5828 comm=3D"syz-executor" path=3D"net:[40265318=
33]" dev=3D"nsfs" ino=3D4026531833 scontext=3Droot:sysadm_r:sysadm_t tconte=
xt=3Dsystem_u:object_r:nsfs_t tclass=3Dfile permissive=3D1
[   72.472115][   T30] audit: type=3D1400 audit(1768278064.423:81): avc:  d=
enied  { mounton } for  pid=3D5828 comm=3D"syz-executor" path=3D"/" dev=3D"=
sda1" ino=3D2 scontext=3Droot:sysadm_r:sysadm_t tcontext=3Dsystem_u:object_=
r:root_t tclass=3Ddir permissive=3D1
[   72.614307][   T30] audit: type=3D1400 audit(1768278064.723:82): avc:  d=
enied  { mounton } for  pid=3D5827 comm=3D"syz-executor" path=3D"/root/syzk=
aller.oRvwjY/syz-tmp" dev=3D"sda1" ino=3D2042 scontext=3Droot:sysadm_r:sysa=
dm_t tcontext=3Droot:object_r:user_home_t tclass=3Ddir permissive=3D1
[   72.647781][   T30] audit: type=3D1400 audit(1768278064.723:83): avc:  d=
enied  { mount } for  pid=3D5827 comm=3D"syz-executor" name=3D"/" dev=3D"tm=
pfs" ino=3D1 scontext=3Droot:sysadm_r:sysadm_t tcontext=3Dsystem_u:object_r=
:tmpfs_t tclass=3Dfilesystem permissive=3D1
[   72.680449][ T5827] soft_limit_in_bytes is deprecated and will be remove=
d. Please report your usecase to linux-mm@kvack.org if you depend on this f=
unctionality.
[   72.710613][   T30] audit: type=3D1400 audit(1768278064.723:84): avc:  d=
enied  { mounton } for  pid=3D5827 comm=3D"syz-executor" path=3D"/root/syzk=
aller.oRvwjY/syz-tmp/newroot/dev" dev=3D"tmpfs" ino=3D3 scontext=3Droot:sys=
adm_r:sysadm_t tcontext=3Droot:object_r:user_tmpfs_t tclass=3Ddir permissiv=
e=3D1
[   72.747865][   T30] audit: type=3D1400 audit(1768278064.723:85): avc:  d=
enied  { mount } for  pid=3D5827 comm=3D"syz-executor" name=3D"/" dev=3D"pr=
oc" ino=3D1 scontext=3Droot:sysadm_r:sysadm_t tcontext=3Dsystem_u:object_r:=
proc_t tclass=3Dfilesystem permissive=3D1
[   72.770404][   T50] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   72.778851][   T50] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   72.834660][   T34] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   72.843508][   T34] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   73.164131][ T5138] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   73.172297][ T5138] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   73.180246][ T5138] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   73.196749][ T5138] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   73.204345][ T5138] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   74.264425][ T5845] chnl_net:caif_netlink_parms(): no params data found
[   74.807351][ T5845] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   74.821439][ T5845] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   74.828899][ T5845] bridge_slave_0: entered allmulticast mode
[   74.836593][ T5845] bridge_slave_0: entered promiscuous mode
[   74.864560][ T5845] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   74.871733][ T5845] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   74.879122][ T5845] bridge_slave_1: entered allmulticast mode
[   74.886071][ T5845] bridge_slave_1: entered promiscuous mode
[   74.955828][ T5845] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   74.987690][ T5845] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   75.079143][ T5845] team0: Port device team_slave_0 added
[   75.098503][ T5845] team0: Port device team_slave_1 added
[   75.204805][ T5845] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   75.211766][ T5845] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   75.239767][ T5845] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   75.255335][ T5845] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   75.262370][ T5845] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   75.298894][ T5845] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   75.443715][ T5845] hsr_slave_0: entered promiscuous mode
[   75.449871][ T5845] hsr_slave_1: entered promiscuous mode
[   75.592860][ T5845] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   75.608307][ T5845] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   75.617970][ T5845] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   75.628160][ T5845] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   75.708538][ T5845] 8021q: adding VLAN 0 to HW filter on device bond0
[   75.728539][ T5845] 8021q: adding VLAN 0 to HW filter on device team0
[   75.742231][   T34] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   75.749498][   T34] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   75.768885][   T50] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   75.776013][   T50] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   75.907923][ T5845] 8021q: adding VLAN 0 to HW filter on device batadv0
[   75.945758][ T5845] veth0_vlan: entered promiscuous mode
[   75.957083][ T5845] veth1_vlan: entered promiscuous mode
[   75.981363][ T5845] veth0_macvtap: entered promiscuous mode
[   75.990660][ T5845] veth1_macvtap: entered promiscuous mode
[   76.006870][ T5845] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   76.021233][ T5845] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   76.035693][   T50] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   76.046111][   T50] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   76.056220][   T50] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   76.065691][   T50] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
2026/01/13 04:21:08 executed programs: 0
[   76.180451][   T52] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   76.188555][   T52] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   76.196772][   T52] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   76.210549][   T52] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   76.220325][   T52] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   76.223744][   T72] netdevsim netdevsim0 netdevsim3 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   76.302193][   T72] netdevsim netdevsim0 netdevsim2 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   76.393644][   T72] netdevsim netdevsim0 netdevsim1 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   76.413627][ T5926] chnl_net:caif_netlink_parms(): no params data found
[   76.438442][   T72] netdevsim netdevsim0 netdevsim0 (unregistering): uns=
et [1, 0] type 2 family 0 port 6081 - 0
[   76.494052][ T5926] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   76.501225][ T5926] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   76.508469][ T5926] bridge_slave_0: entered allmulticast mode
[   76.515622][ T5926] bridge_slave_0: entered promiscuous mode
[   76.523432][ T5926] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   76.530728][ T5926] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   76.538432][ T5926] bridge_slave_1: entered allmulticast mode
[   76.546031][ T5926] bridge_slave_1: entered promiscuous mode
[   76.578006][ T5926] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   76.589208][ T5926] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   76.615543][ T5926] team0: Port device team_slave_0 added
[   76.622696][ T5926] team0: Port device team_slave_1 added
[   76.645027][ T5926] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   76.651985][ T5926] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   76.678290][ T5926] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   76.690400][ T5926] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   76.697754][ T5926] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   76.726622][ T5926] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   76.762434][ T5926] hsr_slave_0: entered promiscuous mode
[   76.768716][ T5926] hsr_slave_1: entered promiscuous mode
[   76.775549][ T5926] debugfs: 'hsr0' already exists in 'hsr'
[   76.781345][ T5926] Cannot create hsr debugfs directory
[   78.304272][ T5138] Bluetooth: hci0: command tx timeout
[   78.996240][   T72] bridge_slave_1: left allmulticast mode
[   79.002028][   T72] bridge_slave_1: left promiscuous mode
[   79.009209][   T72] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   79.021301][   T72] bridge_slave_0: left allmulticast mode
[   79.027964][   T72] bridge_slave_0: left promiscuous mode
[   79.034032][   T72] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   79.289281][   T72] bond0 (unregistering): (slave bond_slave_0): Releasi=
ng backup interface
[   79.302958][   T72] bond0 (unregistering): (slave bond_slave_1): Releasi=
ng backup interface
[   79.313901][   T72] bond0 (unregistering): Released all slaves
[   79.411479][   T72] hsr_slave_0: left promiscuous mode
[   79.418172][   T72] hsr_slave_1: left promiscuous mode
[   79.424372][   T72] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_0
[   79.431764][   T72] batman_adv: batadv0: Removing interface: batadv_slav=
e_0
[   79.443151][   T72] batman_adv: batadv0: Interface deactivated: batadv_s=
lave_1
[   79.450543][   T72] batman_adv: batadv0: Removing interface: batadv_slav=
e_1
[   79.464996][   T72] veth1_macvtap: left promiscuous mode
[   79.470591][   T72] veth0_macvtap: left promiscuous mode
[   79.476732][   T72] veth1_vlan: left promiscuous mode
[   79.482025][   T72] veth0_vlan: left promiscuous mode
[   79.704321][   T72] team0 (unregistering): Port device team_slave_1 remo=
ved
[   79.727145][   T72] team0 (unregistering): Port device team_slave_0 remo=
ved
[   80.255625][ T5926] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   80.269626][ T5926] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   80.282305][ T5926] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   80.301156][ T5926] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   80.379053][ T5926] 8021q: adding VLAN 0 to HW filter on device bond0
[   80.393475][ T5138] Bluetooth: hci0: command tx timeout
[   80.396938][ T5926] 8021q: adding VLAN 0 to HW filter on device team0
[   80.418036][ T3673] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   80.425216][ T3673] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   80.436608][ T3673] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   80.443785][ T3673] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   80.681996][ T5926] 8021q: adding VLAN 0 to HW filter on device batadv0
[   80.742496][ T5926] veth0_vlan: entered promiscuous mode
[   80.755265][ T5926] veth1_vlan: entered promiscuous mode
[   80.789608][ T5926] veth0_macvtap: entered promiscuous mode
[   80.800489][ T5926] veth1_macvtap: entered promiscuous mode
[   80.822452][ T5926] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   80.838062][ T5926] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   80.854331][   T72] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   80.875850][   T72] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   80.887437][   T72] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   80.903437][   T72] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   80.982693][ T1093] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   81.002995][ T1093] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   81.039017][ T3673] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   81.047802][ T3673] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)
[   81.437183][   T43] cfg80211: failed to load regulatory.db


syzkaller build log:
go env (err=3D<nil>)
AR=3D'ar'
CC=3D'gcc'
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_ENABLED=3D'1'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
CXX=3D'g++'
GCCGO=3D'gccgo'
GO111MODULE=3D'auto'
GOAMD64=3D'v1'
GOARCH=3D'amd64'
GOAUTH=3D'netrc'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOCACHEPROG=3D''
GODEBUG=3D''
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFIPS140=3D'off'
GOFLAGS=3D''
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build2779563656=3D/tmp/go-build -gno-record-gc=
c-switches'
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.24.4'
GOWORK=3D''
PKG_CONFIG=3D'pkg-config'

git status (err=3D<nil>)
HEAD detached at d6526ea3e
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3Dd6526ea3e6ad9081c902859bbb80f9f840377cb4 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20251126-113115"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3Dd6526ea3e6ad9081c902859bbb80f9f840377cb4 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20251126-113115"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dd6526ea3e6ad9081c902859bbb80f9f840377cb4 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20251126-113115"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"d6526ea3e6ad9081c902859bbb80f9f840=
377cb4\"
/usr/bin/ld: /tmp/cchrMEKM.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D15184052580000


Tested on:

commit:         b71e635f Merge tag 'cgroup-for-6.19-rc5-fixes' of git:..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D1859476832863c4=
1
dashboard link: https://syzkaller.appspot.com/bug?extid=3D30b78308ba7e64647=
ff8
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils=
 for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D153f80525800=
00


